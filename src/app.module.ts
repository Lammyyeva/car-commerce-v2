import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { SequelizeModule } from '@nestjs/sequelize';
import { sequelizeConfig } from './database/sequelize.config';
import { BrandsModule } from './modules/brands/brands.module';
import { BodyTypesModule } from './modules/bodyTypes/bodyTypes.module';
import { ModelsModule } from './modules/models/models.module';
import { ColorsModule } from './modules/colors/colors.module';
import { CitiesModule } from './modules/cities/cities.module';
import { ModelBodyTypesModule } from './modules/modelBodyTypes/modelBodyTypes.module';
import { TrimsModule } from './modules/trims/trims.module';
import { CarListing } from './modules/carListing/carListing.entity';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    SequelizeModule.forRootAsync(sequelizeConfig),
    BrandsModule,
    ModelsModule,
    ColorsModule,
    CitiesModule,
    BodyTypesModule,
    ModelBodyTypesModule,
    TrimsModule,
    CarListing,
  ],
})
export class AppModule {}
