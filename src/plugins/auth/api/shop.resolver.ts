import { Args, Mutation, Resolver } from '@nestjs/graphql';
import { Ctx, RequestContext, Transaction } from '@vendure/core';
import { PhoneAuthService } from '../services/phone-auth,service';

@Resolver()
export class PhoneAuthShopResolver {
  constructor(
    private phoneAuthService: PhoneAuthService,
  ) {}

  @Transaction()
  @Mutation()
  async registerWithPhone(
    @Ctx() ctx: RequestContext,
    @Args() args: { input: { phoneNumber: string; password: string } },
  ) {
   const result = await this.phoneAuthService.registerCustomerWithPhone(
      ctx,
      args.input.phoneNumber,
      args.input.password,
    )

    // Send SMS with verification toke

    return {
      success: true,
      // verificationToken: result.verificationToken, // For testing only
      message: result,
    };
  }

  @Transaction()
  @Mutation()
  async verifyPhoneNumber(
    @Ctx() ctx: RequestContext,
    @Args()
    args: {
      input: {
        phoneNumber: string;
        verificationToken: string;
        password?: string;
      };
    },
  ) {
    const result = await this.phoneAuthService.verifyCustomerByPhone(
      ctx,
      args.input.phoneNumber,
      args.input.verificationToken,
      args.input.password,
    );

    if ('error' in result) {
      return {
        success: false,
        message: result.error,
      };
    }

    return {
      success: true,
      message: 'Phone number verified successfully',
    };
  }
}

export const phoneAuthResolvers = [PhoneAuthShopResolver];