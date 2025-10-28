import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { CarListing } from './carListing.entity';
import { Brands } from '../brands/brand.entity';
import { Madel } from '../models/model.entity';
import { Color } from '../colors/color.entity';
import { Trim } from '../trims/trim.entity';
import { TrimAttributes } from '../trim-attributes/trimAttribute.entity';
import { City } from '../cities/city.entity';
import { BadRequestError } from 'src/errors';

@Injectable()
export class CarListingService {
  constructor(
    @InjectModel(CarListing)
    private readonly carlistingRepository: typeof CarListing,
  ) {}

  async create(createCarListingDto) {
    return await this.carlistingRepository.create(createCarListingDto);
  }

  async findAll() {
    const lists = await this.carlistingRepository.findAll({
      attributes: [
        'year',
        'probeg',
        'createdAt',
        'vin',
        'price',
        'isCredit',
        'isObmen',
        'phone',
      ],
      include: [
        {
          model: Brands,
          attributes: ['name'],
        },
        {
          model: Madel,
          attributes: ['name'],
        },
        {
          model: City,
          attributes: ['name'],
        },
        {
          model: Trim,
          attributes: ['name'],
          include: [
            {
              model: TrimAttributes,
              attributes: { exclude: ['trim_id', 'createdAt', 'updatedAt'] },
            },
          ],
        },
      ],
    });

    return lists;
  }

  async findOne(id: number) {
    const found = await this.carlistingRepository.findByPk(id);

    if (!found) {
      throw new BadRequestError('there is no bildiris found');
    }

    const list = await this.carlistingRepository.findOne({
      attributes: [
        'year',
        'probeg',
        'createdAt',
        'vin',
        'price',
        'isCredit',
        'isObmen',
        'phone',
      ],
      include: [
        {
          model: Brands,
          attributes: ['name'],
        },
        {
          model: Madel,
          attributes: ['name'],
        },
        {
          model: Color,
          attributes: ['value'],
        },
        {
          model: City,
          attributes: ['name'],
          include: [
            {
              model: City,
              attributes: ['name'],
            },
          ],
        },
        {
          model: Trim,
          attributes: ['name'],
          include: [
            {
              model: TrimAttributes,
              attributes: { exclude: ['trim_id', 'createdAt', 'updatedAt'] },
            },
          ],
        },
      ],
      where: { id },
    });

    return list;
  }

  async profileCars(userId: number) {
    const list = await this.carlistingRepository.findOne({
      attributes: [
        'year',
        'probeg',
        'createdAt',
        'vin',
        'price',
        'isCredit',
        'isObmen',
        'phone',
      ],
      include: [
        {
          model: Brands,
          attributes: ['name'],
        },
        {
          model: Madel,
          attributes: ['name'],
        },
        {
          model: Color,
          attributes: ['value'],
        },
        {
          model: City,
          attributes: ['name'],
          include: [
            {
              model: City,
              attributes: ['name'],
            },
          ],
        },
        {
          model: Trim,
          attributes: ['name'],
          include: [
            {
              model: TrimAttributes,
              attributes: { exclude: ['trim_id', 'createdAt', 'updatedAt'] },
            },
          ],
        },
      ],
      where: { user_id: userId },
    });

    return list;
  }
}
