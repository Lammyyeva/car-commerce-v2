import { Module } from '@nestjs/common';
import { TrimsService } from './trims.service';
import { TrimsController } from './trims.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { Trim } from './trim.entity';
import { TrimAttributesModule } from '../trim-attributes/trimAttributes.module';

@Module({
  imports: [TrimAttributesModule, SequelizeModule.forFeature([Trim])],
  controllers: [TrimsController],
  providers: [TrimsService],
  exports: [TrimsService],
})
export class TrimsModule {}
