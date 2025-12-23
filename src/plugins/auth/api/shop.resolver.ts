import { Args, Context, Mutation, Query, Resolver } from '@nestjs/graphql';
import { CacheService, Ctx, RequestContext, Transaction } from '@vendure/core';
import { PhoneAuthService } from '../services/phone-auth.service';
import { Response, Request } from 'express';
import { BaseResponse, LoginInput, LoginResponse, RegisterInput, ResetPasswordInput, VerifyPhoneInput } from '../types';

@Resolver()
export class PhoneAuthShopResolver {
  constructor(
    private phoneAuthService: PhoneAuthService,
  ) { }

  @Transaction()
  @Mutation()
  async registerWithPhone(
    @Ctx() ctx: RequestContext,
    @Args('input') input: RegisterInput,
  ): Promise<BaseResponse> {
    const {customFields, password } = input;
    await this.phoneAuthService.registerCustomerWithPhone(
      ctx,
      customFields.phoneNumber,
      password,
    )

    // Send SMS with verification token

    return {
      success: true,
      message: 'user was successfully registered. otp was sent to your email'
    };
  }

  @Transaction()
  @Mutation()
  async verifyPhoneNumber(
    @Ctx() ctx: RequestContext,
    @Args('input')
    input: VerifyPhoneInput): Promise<BaseResponse> {
    const {customFields, verificationCode} = input;

    await this.phoneAuthService.verifyCustomerByPhone(
      ctx,
      customFields.phoneNumber,
      verificationCode,
    );

    return {
      success: true,
      message: 'Phone number verified successfully',
    };
  }

  @Transaction()
  @Mutation()
  async logIn(@Ctx() ctx: RequestContext, @Args('input') input: LoginInput, @Context() { res }: { res: Response }): Promise<LoginResponse> {
    const {customFields, password } = input;
    console.log('heloo controller');
    
    const user = await this.phoneAuthService.logIn(ctx, res, customFields.phoneNumber, password);

    return {
      success: true,
      message: 'user logged in successfully',
      user
    }
  }

  @Transaction()
  @Mutation()
  async forgetPassword(@Ctx() ctx: RequestContext, @Args('input') input: { customFields: {phoneNumber: string} }): Promise<BaseResponse> {
    console.log('hello service phone: ', input.customFields.phoneNumber);
    
    await this.phoneAuthService.forgetPassword(ctx, input.customFields.phoneNumber);

    return {
      success: true,
      message: 'otp was sent to you phone  number'
    }
  }

  @Transaction()
  @Mutation()
  async resetPasswordWithPhone(@Ctx() ctx: RequestContext, @Context() { res }: { res: Response }, @Args('input') input: ResetPasswordInput) {
    const {customFields, verificationCode, password} = input;
    await this.phoneAuthService.resetPassword(ctx, res, customFields.phoneNumber, verificationCode, password);

    return {
      success: true,
      message: 'password was reset successfully'
    }
  }

  @Transaction()
  @Query()
  async refreshToken(@Ctx() ctx: RequestContext, @Context() { req, res }: { req: Request, res: Response }) {
    await this.phoneAuthService.refreshToken(ctx, req, res);

    return {
      success: true,
      message: 'tokens was set successfully'
    }
  }

  @Transaction()
  @Query()
  async logOut(@Ctx() ctx: RequestContext, @Context() { res }: { res: Response }) {
    await this.phoneAuthService.logOut(ctx, res);

    return {
      success: true,
      message: 'user was logged out successfully'
    }
  }

}



