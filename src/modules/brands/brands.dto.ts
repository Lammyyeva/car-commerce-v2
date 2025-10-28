import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { IBrandResponse, IModelResponseDetail } from 'src/types/brands';

export class CreateBrandDto {
  @ApiProperty({ description: 'product id of the product item' })
  @IsString()
  @IsNotEmpty()
  readonly name: string;

  @ApiProperty({ description: 'images of the product item' })
  @IsString()
  @IsNotEmpty()
  readonly imageUrl: string;
}

export class UpdateBrandDto extends PartialType(CreateBrandDto) {}

export class BrandResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly imageUrl: string;

  @ApiProperty()
  readonly createdAt: Date;

  @ApiProperty()
  readonly updatedAt: Date;

  constructor(model: IBrandResponse) {
    this.id = model.id;
    this.name = model.name;
    this.imageUrl = model.image_url;
    this.createdAt = model.createdAt;
    this.updatedAt = model.updatedAt;
  }
}

export class BrandlistsResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly imageUrl: string;

  @ApiProperty()
  readonly models: IModelResponseDetail[];

  constructor(model: IBrandResponse) {
    this.id = model.id;
    this.name = model.name;
    this.imageUrl = model.image_url;
    this.models = model.models.map((model) => ({
      id: model.id,
      name: model.name,
      yearStart: model.year_start,
      yearEnd: model.year_end,
    }));
  }
}
