import { Module } from '@nestjs/common';
import { BodyTypesService } from './bodyTypes.service';
import { BodyTypesController } from './bodyTypes.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { BodyType } from './bodyType.entity';

@Module({
  imports: [SequelizeModule.forFeature([BodyType])],
  controllers: [BodyTypesController],
  providers: [BodyTypesService],
})
export class BodyTypesModule {}
