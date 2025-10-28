import { Module } from '@nestjs/common';
import { ModelBodyTypesService } from './modelBodyTypes.service';
import { ModelBodyTypesController } from './modelBodyTypes.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { ModelBodyType } from './modelBodyType.entity';

@Module({
  imports: [SequelizeModule.forFeature([ModelBodyType])],
  controllers: [ModelBodyTypesController],
  providers: [ModelBodyTypesService],
})
export class ModelBodyTypesModule {}
