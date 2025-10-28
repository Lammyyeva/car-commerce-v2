import { Module } from '@nestjs/common';
import { ColorsService } from './colors.service';
import { ColorsController } from './colors.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { Color } from './color.entity';

@Module({
  imports: [SequelizeModule.forFeature([Color])],
  controllers: [ColorsController],
  providers: [ColorsService],
})
export class ColorsModule {}
