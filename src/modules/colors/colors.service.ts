import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Color } from './color.entity';

@Injectable()
export class ColorsService {
  constructor(
    @InjectModel(Color)
    private readonly colorsRepository: typeof Color
  ){}

  async create(createColorDto) {
    return await this.colorsRepository.create(createColorDto);
  };

  async findAllColors() {
    return await this.colorsRepository.findAll();
  }

  // findOne(id: number) {
  //   return `This action returns a #${id} color`;
  // }

  // update(id: number, updateColorDto: UpdateColorDto) {
  //   return `This action updates a #${id} color`;
  // }

  // remove(id: number) {
  //   return `This action removes a #${id} color`;
  // }
}
