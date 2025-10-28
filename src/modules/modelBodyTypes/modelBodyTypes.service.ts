import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { ModelBodyType } from './modelBodyType.entity';

@Injectable()
export class ModelBodyTypesService {
  constructor(
    @InjectModel(ModelBodyType)
    private readonly modelBTypesRepository: typeof ModelBodyType
  ){}

  async create(createModelBTypeDto) {
    return await this.modelBTypesRepository.create(createModelBTypeDto);
  }

  findAll() {
    return `This action returns all modelBodyTypes`;
  }

  // findOne(id: number) {
  //   return `This action returns a #${id} modelBodyType`;
  // }

  // update(id: number, updateModelBodyTypeDto: UpdateModelBodyTypeDto) {
  //   return `This action updates a #${id} modelBodyType`;
  // }

  // remove(id: number) {
  //   return `This action removes a #${id} modelBodyType`;
  //}
}
