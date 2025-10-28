import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';
import { IBTypeResponse, IModelResponse, ITrimResponse } from 'src/types/model';
import { IAttrs } from 'src/types/trim';

export class CreateModelDto {
  @ApiProperty({ description: 'name of the model' })
  @IsString()
  @IsNotEmpty()
  readonly name: string;

  @ApiProperty({ description: 'brand id of the related model' })
  @IsNumber()
  @IsNotEmpty()
  readonly brand_id: number;

  @ApiProperty({ description: 'year this model was made' })
  @IsNumber()
  @IsNotEmpty()
  readonly yearStart: number;

  @ApiProperty({ description: 'year this model was finished production' })
  @IsNumber()
  @IsOptional()
  readonly yearEnd: number;
}

export class UpdateModelDto extends PartialType(CreateModelDto) {}

export class ModelResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly brandId: number;

  @ApiProperty()
  readonly yearStart: number;

  @ApiProperty()
  readonly yearEnd: number | null;

  @ApiProperty()
  readonly createdAt: Date;

  @ApiProperty()
  readonly updatedAt: Date;

  constructor(model: IModelResponse) {
    this.id = model.id;
    this.name = model.name;
    this.brandId = model.brand_id;
    this.yearStart = model.year_start;
    this.yearEnd = model.year_end;
    this.createdAt = model.createdAt;
    this.updatedAt = model.updatedAt;
  }
}

export class ModelWithBTypeResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly bodyTypes: IBTypeResponse[];
}

export class ModelTrimsByYearResponse {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly trim: string;

  @ApiProperty()
  readonly characteristics: IAttrs[];

  constructor(model: ITrimResponse) {
    this.id = model.id;
    this.trim = model.name;
    this.characteristics = model.attributes.map((attr) => ({
      capacity: attr.capacity,
      driveType: attr.drive_type,
      transmissionType: attr.transmission_type,
      horsePower: attr.horse_power
    }));
  }
}
