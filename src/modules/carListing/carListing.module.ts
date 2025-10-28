import { Module } from '@nestjs/common';
import { CarListingService } from './carListing.service';
import { CarListingController } from './carListing.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { CarListing } from './carListing.entity';

@Module({
  imports: [SequelizeModule.forFeature([CarListing])],
  controllers: [CarListingController],
  providers: [CarListingService],
})
export class CarListingModule {}
