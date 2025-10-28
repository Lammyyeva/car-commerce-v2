import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { TrimAttributes } from './trimAttribute.entity';

@Injectable()
export class TrimAttributesService {
  constructor(
    @InjectModel(TrimAttributes)
    private readonly trimAttributesRepository: typeof TrimAttributes
  ){}

  async create(createTrimAttributeData) {
    return await this.trimAttributesRepository.bulkCreate(
      createTrimAttributeData,
    );
  }
}
