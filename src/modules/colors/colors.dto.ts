import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { IColorResponse } from 'src/types/color';

export class CreateColorDto {
  @ApiProperty({ description: 'product id of the product item' })
  @IsString()
  @IsNotEmpty()
  readonly value: string;
}

export class UpdateColorDto extends PartialType(CreateColorDto) {}

export class ColorResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly value: string;

  constructor(model: IColorResponse) {
    this.id = model.id;
    this.value = model.value;
  }
}
