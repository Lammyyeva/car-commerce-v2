
import { BadRequestException, Inject, Injectable } from '@nestjs/common';
import {
  RequestContext,
  TransactionalConnection,
  UserService,
  User,
  CustomerService,
  isGraphQlErrorResult,
  NativeAuthenticationMethod,
  CacheService,
  PasswordCipher,
  NativeAuthenticationStrategy,
  AuthService,
} from '@vendure/core';
import { randomInt } from 'crypto';
import { FORGET_PASSWORD, VERIFY } from '../../../apps/server/src/shared/constants';
import { CookieService } from './cookie.service';
import { Response } from 'express';
import { Request } from 'express';
import {   CustomJwtService } from './jwt.Service';
import { UserResponse } from '../types';


@Injectable()
export class PhoneAuthService {
  constructor(
    private userService: UserService,
    private connection: TransactionalConnection,
    private cacheService: CacheService,
    private passwordCipher: PasswordCipher,
    private jwtService: CustomJwtService,
    private cookieService: CookieService,
    private authService: AuthService
  ) { }

  private async validateRegister(ctx: RequestContext, phoneNumber: string) {
    const existingUser = await this.connection
      .getRepository(ctx, User)
      .findOne({
        where: { customFields: { phoneNumber } },
      });

    if (existingUser) {
      throw new BadRequestException('this phone number is already registered');
    }
  }

  private async validateLogin(ctx: RequestContext, phoneNumber: string, password: string) {
    const foundUser = await this.connection.getRepository(ctx, User).findOne({where: {customFields: {phoneNumber}}});
        if (!foundUser) {
      throw new BadRequestException('there is user found');
    }

   const isPasswordValid = await this.authService.verifyUserPassword(ctx, foundUser.id, password);
   console.log('buiklt in servuce pswd ', isPasswordValid);
   if (isPasswordValid && typeof isPasswordValid === 'object' && 'errorCode' in isPasswordValid) {
      throw new BadRequestException('Incorrect password');
  }

    return foundUser;
  }

  async registerCustomerWithPhone(
    ctx: RequestContext,
    phoneNumber: string,
    password: string,
  ) {

    await this.validateRegister(ctx, phoneNumber);

    const identifier = `${phoneNumber}@phoneNumber.local`;

    const user = await this.userService.createCustomerUser(ctx, identifier, password);

    // const customer = await this.customerService.registerCustomerAccount(ctx, {
    //   emailAddress,
    //   password,
    //   phoneNumber      // bu method hem customer'y hem user'y doretya
    // });

    if (isGraphQlErrorResult(user)) {
      throw new BadRequestException(user.message);
    }

    user.customFields = {
      ...user.customFields,
      phoneNumber
    }    
    await this.connection.getRepository(ctx, User).save(user);

    const verificationCode = randomInt(100000, 999999).toString();
    await this.cacheService.set(`${VERIFY}:${phoneNumber}`, verificationCode, { ttl: Number(process.env.OTP_TTL) })

    console.log('otp: ', verificationCode);
  }


  async verifyCustomerByPhone(
    ctx: RequestContext,
    phoneNumber: string,
    otp: string,
  ) {
    const corectOtp = await this.cacheService.get(`${VERIFY}:${phoneNumber}`);
    console.log('correctotp: ', corectOtp);
    if (!corectOtp) {
      throw new BadRequestException('otp has expired')
    }
    if (corectOtp !== otp) {
      throw new BadRequestException('otp is invalid');
    }

    const user = await this.connection
      .getRepository(ctx, User)
      .findOne({
        where: { customFields: { phoneNumber } }, /// correct this, and save customer after verification
      });
    if (!user) {
      throw new BadRequestException('User not found')
    }

    user.verified = true;
    await this.connection.getRepository(ctx, User).save(user);

    await this.cacheService.delete(`${VERIFY}:${phoneNumber}`);
    return user;
  }


  async logIn(ctx: RequestContext, res: Response, phoneNumber: string, password: string) {
    const user = await this.validateLogin(ctx, phoneNumber, password);

    user.lastLogin = new Date();
   const {authenticationMethods, sessions, ...rest} = await this.connection.getRepository(ctx, User).save(user);

    this.setTokens(rest, res);

    return rest;
  }



  async forgetPassword(ctx: RequestContext, phoneNumber: string) {
    const verificationCode = randomInt(100000, 999999).toString();
    await this.cacheService.set(`${FORGET_PASSWORD}:${phoneNumber}`, verificationCode, { ttl: Number(process.env.OTP_TTL) });

    console.log(' forget otp', verificationCode);
  }

  async resetPassword(ctx: RequestContext, res: Response, phoneNumber: string, otp: string, password: string) {
    const foundUser = await this.connection
    .getRepository(ctx, User)
    .createQueryBuilder('user')
    .leftJoinAndSelect('user.authenticationMethods', 'authMethod')
    .addSelect('authMethod.passwordHash')  // Explicitly select the passwordHash field
    .where('user.customFields.phoneNumber = :phoneNumber', { phoneNumber })
    .getOne();
    if (!foundUser) {
      throw new BadRequestException('there is user found');
    }

    const correctOtp = await this.cacheService.get(`${FORGET_PASSWORD}:${phoneNumber}`);
    if (!correctOtp) {
      throw new BadRequestException('otp has expired')
    }
    if (correctOtp != Number(otp)) {
      throw new BadRequestException('invalid otp');
    }

    const nativeAuthMethod = foundUser.authenticationMethods?.[0] as NativeAuthenticationMethod; 
    if (!nativeAuthMethod || !nativeAuthMethod.passwordHash) {
      throw new BadRequestException('authentication method not found2');
    }
    nativeAuthMethod.passwordHash = await this.passwordCipher.hash(password);
    await this.connection.getRepository(ctx, NativeAuthenticationMethod).save(nativeAuthMethod);

    const {authenticationMethods, sessions, ...rest} = foundUser;

    this.setTokens(rest, res);
  }

  async refreshToken(ctx: RequestContext, req: Request, res: Response) {
    const { refreshToken } = req.cookies;
    const isValidToken = this.jwtService.verifyToken(refreshToken);
    if (!isValidToken) {
      throw new BadRequestException('invalid token');
    }

    const decodeUser = this.jwtService.decodeToken(refreshToken);
    if (!decodeUser) {
      throw new BadRequestException('this token is imposible to decode')
    }

    const {authenticationMethods, sessions, ...rest} = decodeUser;

    this.setTokens(rest, res);
  }

  async logOut(ctx: RequestContext, res: Response) {
    this.cookieService.removeCookies(res, 'accessToken');
    this.cookieService.removeCookies(res, 'refreshToken');
  }

  private setTokens(payload: UserResponse, res: Response) {    
    const { accessToken, refreshToken } = this.jwtService.generateTokens(payload);

    this.cookieService.attachTokenToCookie(res, 'accessToken', accessToken, '1');
    this.cookieService.attachTokenToCookie(res, 'refreshToken', refreshToken, '3'); 
    //need to save refreshToken but why
  }



}