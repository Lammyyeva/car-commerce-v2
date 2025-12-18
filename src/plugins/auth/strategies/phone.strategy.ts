import { BadRequestException, Injectable } from '@nestjs/common';
import {
  AuthenticationStrategy,
  Injector,
  RequestContext,
  TransactionalConnection,
  User,
  NativeAuthenticationMethod,
  PasswordCipher,
  VerificationTokenStrategy,
  CacheService,
} from '@vendure/core';
import { DocumentNode } from 'graphql';
import gql from 'graphql-tag';
import { VERIFY } from 'src/apps/server/src/shared/constants';


@Injectable()
export class PhoneLoginStrategy implements AuthenticationStrategy<{
  phoneNumber: string;
  password: string;
}> {
  readonly name = 'phoneLogin';
  private connection: TransactionalConnection;
  private passwordCipher: PasswordCipher;

  init(injector: Injector) {
    this.connection = injector.get(TransactionalConnection);
    this.passwordCipher = injector.get(PasswordCipher);
  }

  defineInputType(): DocumentNode {
    return gql`
      input PhoneAuthInput {
        phoneNumber: String!
        password: String!
      }
    `;
  }

  async authenticate(
    ctx: RequestContext,
    data: { phoneNumber: string; password: string },
  ): Promise<User | false | string> {
    const user = await this.connection
      .getRepository(ctx, User)
      .createQueryBuilder('user')
      .leftJoinAndSelect('user.authenticationMethods', 'authMethod')
      .addSelect('authMethod.passwordHash')
      .leftJoin('user.roles', 'roles')
      .leftJoin('roles.channels', 'channels')
      .where('user.customFields.phoneNumber = :phoneNumber', {
        phoneNumber: data.phoneNumber,
      })
      .andWhere('channels.id = :channelId', { channelId: ctx.channelId })
      .getOne();

    if (!user) {
      return false;
    }

    const nativeAuthMethod = user.authenticationMethods.find(
      (m): m is NativeAuthenticationMethod =>
        m instanceof NativeAuthenticationMethod,
    );

    if (!nativeAuthMethod) {
      return false;
    }

    const passwordMatch = await this.passwordCipher.check(
      data.password,
      nativeAuthMethod.passwordHash,
    );

    if (!passwordMatch) {
      return false;
    }

    if (!user.verified) {
      return 'User not verified';
    }

    return user;
  }
}

export class PhoneVerificationStrategy implements VerificationTokenStrategy{
  private cacheService: CacheService;

  init(injector: Injector){
    this.cacheService = injector.get(CacheService);
  }

  async generateVerificationToken(ctx: RequestContext): Promise<string> {
    const verificationCode = Math.floor(100000 + Math.random() * 900000).toString();

    const key = this.getKey(ctx);
        
    await this.cacheService.set(`${VERIFY}:${key}`, verificationCode, {ttl: Number( process.env.OTP_TTL)});

    console.log('verificationCode set', verificationCode);
    return 'success'
  }

  async verifyVerificationToken(ctx: RequestContext, otp: string): Promise<boolean> {
    const key = this.getKey(ctx);

    const corectOtp = await this.cacheService.get(`${VERIFY}:${key}`);

    if (!corectOtp || corectOtp != Number(otp)) {
      throw new BadRequestException('otp has expired or invalid');
    }

    return true;

  }
  private getKey(ctx: RequestContext){
    return `${ctx.activeUserId}`
  }
}