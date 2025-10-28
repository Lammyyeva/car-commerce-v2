import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber } from 'class-validator';
import { IModelBTypeResponse } from 'src/types/modelBTypes';

export class CreateModelBTypeDto {
  @ApiProperty({ description: 'model id' })
  @IsNumber()
  @IsNotEmpty()
  readonly modelId: number;

  @ApiProperty({ description: 'body type id' })
  @IsNumber()
  @IsNotEmpty()
  readonly bTypeId: number;
}

export class UpdateModelBTypeDto extends PartialType(CreateModelBTypeDto) {}

export class ModelBTypeResponseDto {
  @ApiProperty()
  readonly modelId: number;

  @ApiProperty()
  readonly bodyTypeId: number;

  @ApiProperty()
  readonly createdAt: Date;

  @ApiProperty()
  readonly updatedAt: Date;

  constructor(model: IModelBTypeResponse) {
    this.modelId = model.model_id;
    this.bodyTypeId = model.body_type_id;
    this.createdAt = model.createdAt;
    this.updatedAt = model.updatedAt;
  }
}
