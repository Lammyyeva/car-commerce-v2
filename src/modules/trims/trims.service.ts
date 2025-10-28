import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Trim } from './trim.entity';
import { CreateTrimDto } from './trim.dto';
import { TrimAttributesService } from '../trim-attributes/trimAttributes.service';
import { TrimAttributes } from '../trim-attributes/trimAttribute.entity';

@Injectable()
export class TrimsService {
  constructor(
    @InjectModel(Trim)
    private readonly trimsRepository: typeof Trim,
    private readonly trimAttributesService: TrimAttributesService,
  ) {}

  async create(createTrimDto: CreateTrimDto) {
    const createTrimData = {
      name: createTrimDto.name,
      year: createTrimDto.year,
      model_id: createTrimDto.modelId,
      bType_id: createTrimDto.bTypeId,
    };
    const createdTrim = await this.trimsRepository.create(
      createTrimData as any,
    );

    const trimId = createdTrim.dataValues.id;

    const attributeData = createTrimDto.characteristics.map((attr) => ({
      capacity: attr.capacity,
      horse_power: attr.horsePower,
      drive_type: attr.driveType,
      transmission_type: attr.transmissionType,
      trim_id: trimId,
    }));

    await this.trimAttributesService.create(attributeData);

    return createdTrim;
  }

  async findAllByYear(model_id: number, year: number) {
    return await this.trimsRepository.findAll({
      attributes: ['name'],
      include: [
        {
          model: TrimAttributes,
          attributes: { exclude: ['id', 'createdAt', 'updatedAt'] },
        },
      ],
      where: { model_id, year },
    });
  }

  async findAllPerBType(model_id: number, year: number, bType_id: number) {
    return await this.trimsRepository.findAll({
      attributes: ['name'],
      include: [
        {
          model: TrimAttributes,
          attributes: { exclude: ['id', 'createdAt', 'updatedAt'] },
        },
      ],
      where: { model_id, year, bType_id },
    });
  }
}
