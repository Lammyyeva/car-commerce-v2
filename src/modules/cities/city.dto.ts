import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';
import { ICityResponse } from 'src/types/city';

export class CreateCityDto {
  @ApiProperty({ description: 'name of the city' })
  @IsString()
  @IsNotEmpty()
  readonly name: string;

  @ApiProperty({ description: 'parent id of the city' })
  @IsNumber()
  @IsOptional()
  readonly parentId: number;
}

export class UpdateColorDto extends PartialType(CreateCityDto) {}

export class CityResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly parentId: number | null;

  @ApiProperty()
  readonly createdAt: Date;

  @ApiProperty()
  readonly updatedAt: Date;

  constructor(model: ICityResponse) {
    this.id = model.id;
    this.name = model.name;
    this.parentId = model.parent_id;
    this.createdAt = model.createdAt;
    this.updatedAt = model.updatedAt;
  }
}


export class CityListResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly parentId: number | null;

  @ApiProperty()
  readonly children: CityListResponseDto[] = [] 

  constructor(model: ICityResponse) {
    this.id = model.id;
    this.name = model.name;
    this.parentId = model.parent_id;
  }
}