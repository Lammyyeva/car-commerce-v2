import { Controller, Get, Post, Body, Param, Delete } from '@nestjs/common';
import { BrandsService } from './brands.service';
import {
  BrandlistsResponseDto,
  BrandResponseDto,
  CreateBrandDto,
} from './brands.dto';
import {
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
} from '@nestjs/swagger';
import { BadRequestError } from 'src/errors';

@Controller('brands')
export class BrandsController {
  constructor(private readonly brandsService: BrandsService) {}

  @ApiOperation({ summary: 'it is used to post brand' })
  @ApiCreatedResponse({ type: BrandResponseDto })
  @Post()
  async create(
    @Body() createBrandDto: CreateBrandDto,
  ): Promise<BrandResponseDto> {
    if (!createBrandDto.imageUrl || !createBrandDto.name) {
      throw new BadRequestError('please provide all credentials');
    }

    const brandData = {
      name: createBrandDto.name,
      image_url: createBrandDto.imageUrl,
    };

    const result = await this.brandsService.create(brandData);

    return new BrandResponseDto(result);
  }

  @ApiOperation({ summary: 'It is used to get all brands' })
  @ApiOkResponse({ type: BrandResponseDto })
  @Get()
  async findAll(): Promise<BrandResponseDto[]> {
    const results = await this.brandsService.findAll();

    const brands = results.map((result) => new BrandResponseDto(result));

    return brands;
  }

  @ApiOperation({ summary: 'It is used to get brands with their models' })
  @ApiOkResponse({ type: BrandResponseDto })
  @Get('/brandlists')
  async findAllBrandLists(): Promise<BrandlistsResponseDto[]> {
    const results = await this.brandsService.findBrandLists();

    const brands = results.map((result) => new BrandlistsResponseDto(result));

    return brands;
  }
}
