import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { Brands } from './brand.entity';
import { Madel } from '../models/model.entity';

@Injectable()

export class BrandsService {
  constructor( 
    @InjectModel(Brands)
    private readonly brandsrepository: typeof Brands
  ){}

  async create(createBrandDto) {
    return await this.brandsrepository.create(createBrandDto);
  }

  async findAll() {
    return await this.brandsrepository.findAll();
  }

  async findBrandLists() {
    return await this.brandsrepository.findAll({
      attributes: ['id', 'name', 'image_url'],
      include: [
        {
          model: Madel,
          attributes: ['id', 'name', 'year_start', 'year_end']
        }
      ]
    });
  }
}
