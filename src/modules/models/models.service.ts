import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Madel } from './model.entity';
import { BodyType } from '../bodyTypes/bodyType.entity';
import { NotFoundError } from 'src/errors/notFoundError';
import { TrimsService } from '../trims/trims.service';

@Injectable()
export class ModelsService {
  constructor(
    @InjectModel(Madel)
    private readonly modelsRepository: typeof Madel,
    private readonly trimsService: TrimsService,
  ) {}
  async create(createModelDto) {
    return await this.modelsRepository.create(createModelDto);
  }

  async findAll() {
    return await this.modelsRepository.findAll();
  }

  async findOneAndBType(id: number) {
    const found = await this.modelsRepository.findByPk(id);

    if (!found) {
      throw new NotFoundError('there is no model found');
    }

    const model = await this.modelsRepository.findOne({
      attributes: ['id', 'name'],
      include: {
        model: BodyType,
        attributes: ['id', 'name'],
        through: {
          attributes: [],
          where: { model_id: id },
        },
      },
      where: { id },
    });
    return model;
  }

  async findTrims(id: number, year: number) {
    const found = await this.modelsRepository.findByPk(id);

    if (!found) {
      throw new NotFoundError('there is no model found');
    }

    const trims = await this.trimsService.findAllByYear(id, year);

    return trims;
  }

  async findTrimsPerBType(id: number, year: number, bTypeId: number) {
    const found = await this.modelsRepository.findByPk(id);

    if (!found) {
      throw new NotFoundError('there is no model found');
    }

    const trims = await this.trimsService.findAllPerBType(id, year, bTypeId);

    return trims;
  }
}
