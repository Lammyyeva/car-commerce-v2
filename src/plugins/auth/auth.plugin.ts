import { AuthService, NativeAuthenticationStrategy, PluginCommonModule, VendurePlugin } from '@vendure/core';
import { PhoneAuthService } from './services/phone-auth.service';
import { phoneAuthSchema } from './api/schema';
import { PhoneLoginStrategy } from './strategies/phone.strategy';
import { PhoneAuthShopResolver } from './api/shop.resolver';
import { CustomJwtService } from './services/jwt.Service';
import { CookieService } from './services/cookie.service';
import { JwtModule } from '@nestjs/jwt';


@VendurePlugin({
  imports: [PluginCommonModule, JwtModule.register({
      secret: process.env.SECRET_KEY,
    }),],
  providers: [
    PhoneAuthService,
    CustomJwtService,
    CookieService,
    NativeAuthenticationStrategy,
    AuthService
  ],
  shopApiExtensions: {
    schema: phoneAuthSchema,
    resolvers: [PhoneAuthShopResolver],
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
  compatibility: '^3.0.0'
})
export class AuthPlugin { }