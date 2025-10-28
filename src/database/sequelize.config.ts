import { SequelizeModuleAsyncOptions } from '@nestjs/sequelize';
import { DEVELOPMENT, PRODUCTION, TEST } from 'src/constants';
import { databaseConfig } from './db.config';
import { Brands } from 'src/modules/brands/brand.entity';
import { Madel } from 'src/modules/models/model.entity';
import { BodyType } from 'src/modules/bodyTypes/bodyType.entity';
import { ModelBodyType } from 'src/modules/modelBodyTypes/modelBodyType.entity';
import { Color } from 'src/modules/colors/color.entity';
import { City } from 'src/modules/cities/city.entity';
import { Trim } from 'src/modules/trims/trim.entity';
import { TrimAttributes } from 'src/modules/trim-attributes/trimAttribute.entity';
import { CarListing } from 'src/modules/carListing/carListing.entity';

export const sequelizeConfig: SequelizeModuleAsyncOptions = {
  useFactory: () => {
    let config;
    switch (process.env.NODE_ENV) {
      case DEVELOPMENT:
        config = databaseConfig.development;
        break;
      case PRODUCTION:
        config = databaseConfig.production;
        break;
      case TEST:
        config = databaseConfig.test;
        break;
      default:
        config = databaseConfig.development;
    }
    return {
      ...config,
      models: [
        Brands,
        Madel,
        BodyType,
        ModelBodyType,
        Color,
        City,
        Trim,
        TrimAttributes,
        CarListing,
      ],
      autoLoadModels: true,
      synchronize: true,
    };
  },
};
