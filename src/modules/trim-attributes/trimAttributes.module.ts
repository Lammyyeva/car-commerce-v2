import { Module } from '@nestjs/common';
import { TrimAttributesService } from './trimAttributes.service';
import { SequelizeModule } from '@nestjs/sequelize';
import { TrimAttributes } from './trimAttribute.entity';

@Module({
  imports: [SequelizeModule.forFeature([TrimAttributes])],
  providers: [TrimAttributesService],
  exports: [TrimAttributesService]
})
export class TrimAttributesModule {}
