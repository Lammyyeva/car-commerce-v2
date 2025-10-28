import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/sequelize';
import { City } from './city.entity';
import { CityListResponseDto } from './city.dto';

@Injectable()
export class CitiesService {
  constructor(
    @InjectModel(City)
    private readonly citiesRepository: typeof City,
  ) {}

  async create(createCityDto) {
    return await this.citiesRepository.create(createCityDto);
  }

  async findAllColors() {
    const cities = await this.citiesRepository.findAll();

    const cityresponseDto = cities.map((city) => new CityListResponseDto(city));

    return this.buildCityTree(cityresponseDto, null);
  }

  private buildCityTree(
    cities: CityListResponseDto[],
    parentId: number | null,
  ) {
    return cities
      .filter((city) => city.parentId === parentId)
      .map((city) => {
        const result = {
          ...city,
          children: this.buildCityTree(cities, city.id),
        } as CityListResponseDto;

        return result;
      });
  }
}
