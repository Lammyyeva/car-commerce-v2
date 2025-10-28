import { Module } from '@nestjs/common';
import { ModelsService } from './models.service';
import { ModelsController } from './models.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { Madel } from './model.entity';
import { TrimsModule } from '../trims/trims.module';

@Module({
  imports: [TrimsModule, SequelizeModule.forFeature([Madel])],
  controllers: [ModelsController],
  providers: [ModelsService],
})
export class ModelsModule {}
