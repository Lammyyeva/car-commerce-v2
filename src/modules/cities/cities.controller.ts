import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { CitiesService } from './cities.service';
import {
  CityListResponseDto,
  CityResponseDto,
  CreateCityDto,
} from './city.dto';
import { Color } from '../colors/color.entity';
import { ApiCreatedResponse, ApiOperation } from '@nestjs/swagger';
import { BadRequestError } from 'src/errors';

@Controller('cities')
export class CitiesController {
  constructor(private readonly citiesService: CitiesService) {}

  @ApiOperation({ summary: 'it is used to post color' })
  @ApiCreatedResponse({ type: CityResponseDto })
  @Post()
  async create(@Body() createCityDto: CreateCityDto): Promise<CityResponseDto> {
    if (!createCityDto.name) {
      throw new BadRequestError('please provide all credentials');
    }

    const cityData = {
      name: createCityDto.name,
      parent_id: createCityDto?.parentId,
    };

    const result = await this.citiesService.create(cityData);

    return new CityResponseDto(result);
  }

  @ApiOperation({ summary: 'it is used to get all colors' })
  @ApiCreatedResponse({ type: CityListResponseDto })
  @Get()
  async findAllCityLists(): Promise<CityListResponseDto[]> {
    const results = await this.citiesService.findAllColors();

    return results;
  }
}