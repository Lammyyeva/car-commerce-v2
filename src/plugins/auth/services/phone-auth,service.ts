
import { BadRequestException, Injectable } from '@nestjs/common';
import {
  RequestContext,
  TransactionalConnection,
  UserService,
  User,
  Customer,
  CustomerService,
  isGraphQlErrorResult,
  VerificationTokenGenerator,
  NativeAuthenticationMethod,
  CacheService,
} from '@vendure/core';
import { VERIFY } from 'src/apps/server/src/shared/constants';

@Injectable()
export class PhoneAuthService {
  constructor(
    private userService: UserService,
    private customerService: CustomerService,
    private connection: TransactionalConnection,
    private verificationTokenGenerator: VerificationTokenGenerator,
    private cacheService: CacheService
  ) {}

   async registerCustomerWithPhone(
    ctx: RequestContext,
    phoneNumber: string,
    password: string,
  ): Promise<{message: string}> {

    // Check if phone number already exists using native phoneNumber field
    const existingCustomer = await this.connection
      .getRepository(ctx, Customer)
      .findOne({
        where: { phoneNumber },
      });

    if (existingCustomer) {
      throw new BadRequestException('this phone number is already registered');
    }

    const internalEmail = `${phoneNumber.replace(/[^0-9]/g, '')}@phone.internal`;

    const user = await this.userService.createCustomerUser(ctx, internalEmail, password);

    if (isGraphQlErrorResult(user)) {
      throw user;
    }

    user.customFields = {
      ...user.customFields,
      phoneNumber
    }
    
    const verificationCode = Math.floor(100000 + Math.random() * 900000).toString();
    await this.connection.getRepository(ctx, User).save(user);

    await this.cacheService.set(`${VERIFY}:${phoneNumber}`, verificationCode, {ttl: Number(process.env.OTP_TTL)})

    console.log('otp: ', verificationCode);
    
    return {
      message: 'user was successfully registered. otp was sent to your email'
    }
  }


  async verifyCustomerByPhone(
    ctx: RequestContext,
    phoneNumber: string,
    verificationToken: string,
    password?: string,
  ): Promise<User | { error: string }> {
    const customer = await this.connection
      .getRepository(ctx, Customer)
      .findOne({
        where: { customFields: { phoneNumber } as any },
        relations: ['user'],
      });

    if (!customer) {
      return { error: 'Phone number not found' };
    }

    const result = await this.userService.verifyUserByToken(
      ctx,
      verificationToken,
      password,
    );

    if (isGraphQlErrorResult(result)) {
      return { error: result.message };
    }

    return result;
  }

}