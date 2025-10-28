import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { BodyType } from './bodyType.entity';

@Injectable()
export class BodyTypesService {
  constructor(
    @InjectModel(BodyType)
    private readonly bTypesRepository: typeof BodyType
  ){}

  async create(createBodyTypeDto) {
    return await this.bTypesRepository.create(createBodyTypeDto);
  }

  async findAll() {
    return await this.bTypesRepository.findAll();
  }
}
