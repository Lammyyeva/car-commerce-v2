import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsNumber, IsString } from 'class-validator';
import { IBTypeResponse } from 'src/types/model';
import { IAttrs, ICreateTrimResponse } from 'src/types/trim';

export class CreateTrimDto {
  @ApiProperty({ description: 'name of the trim' })
  @IsString()
  @IsNotEmpty()
  readonly name: string;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly year: number;

  @ApiProperty({ description: 'model id of the related trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly modelId: number;

  @ApiProperty({ description: 'body type id of the related trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly bTypeId: number;

  @ApiProperty({ description: 'ohter properties of the trim' })
  @IsNotEmpty()
  readonly characteristics: IAttrs[];
}


// export class AttrsDetail{
//   @ApiProperty({ description: 'body type id of the related trim' })
//   @IsNumber()
//   @IsNotEmpty()
//   readonly capacity: number;

//   @ApiProperty({ description: 'body type id of the related trim' })
//   @IsNumber()
//   @IsNotEmpty()
//   readonly horsePower: number;

//   @ApiProperty({ description: 'body type id of the related trim' })
//   @IsString()
//   @IsNotEmpty()
//   readonly transmissionType: string;

//   @ApiProperty({ description: 'body type id of the related trim' })
//   @IsString()
//   @IsNotEmpty()
//   readonly driveType: string;
// }

export class UpdateTrimDto extends PartialType(CreateTrimDto) {}

export class CreateTrimResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly modelId: number;

  @ApiProperty()
  readonly bTypeId: number;

  @ApiProperty()
  readonly year: number;

  @ApiProperty()
  readonly createdAt: Date;

  @ApiProperty()
  readonly updatedAt: Date;

  constructor(model: ICreateTrimResponse) {
    this.id = model.id;
    this.name = model.name;
    this.modelId = model.model_id;
    this.year = model.year;
    this.bTypeId = model.bType_id;
    this.createdAt = model.createdAt;
    this.updatedAt = model.updatedAt;
  }
}

export class ModelWithTypeResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly bodyTypes: IBTypeResponse[];
}
