import { PluginCommonModule, VendurePlugin } from '@vendure/core';
import { PhoneAuthService } from './services/phone-auth,service';
import { phoneAuthSchema } from './api/schema';
import { phoneAuthResolvers } from './api/shop.resolver';
import { PhoneLoginStrategy } from './strategies/phone.strategy';


@VendurePlugin({
  imports: [PluginCommonModule],
  providers: [
    PhoneAuthService,
  ],
  shopApiExtensions: {
    schema: phoneAuthSchema,
    resolvers: phoneAuthResolvers,
  },
  // adminApiExtensions: {
  //   resolvers: phoneAuthAdminResolvers,
  // },
  configuration: config => {
    config.authOptions.shopAuthenticationStrategy.push(
      new PhoneLoginStrategy(),
    );
    return config;
  },
})
export class AuthPlugin {}