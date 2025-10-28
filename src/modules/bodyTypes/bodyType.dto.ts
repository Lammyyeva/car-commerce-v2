import { ApiProperty, PartialType } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';

export class CreateBTypeDto {
  @ApiProperty({ description: 'name of the body type' })
  @IsString()
  @IsNotEmpty()
  readonly name: string;
}

export class UpdateBTypeDto extends PartialType(CreateBTypeDto) {}

export class BTypeResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly createdAt: Date;

  @ApiProperty()
  readonly updatedAt: Date;
}
