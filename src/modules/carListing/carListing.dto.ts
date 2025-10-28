import { ApiProperty } from '@nestjs/swagger';
import {
  IsBoolean,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
} from 'class-validator';

export class CreateCarListingDto {
  @ApiProperty({ description: 'name of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly brandId: number;

  @ApiProperty({ description: 'name of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly modelId: number;

  @ApiProperty({ description: 'name of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly trimId: number;

  @ApiProperty({ description: 'name of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly bTypeId: number;

  @ApiProperty({ description: 'name of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly cityId: number;

  @ApiProperty({ description: 'name of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly colorId: number;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly year: number;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly price: number;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsNumber()
  @IsNotEmpty()
  readonly probeg: number;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsString()
  @IsNotEmpty()
  readonly phone: string;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsString()
  @IsOptional()
  readonly vin: string;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsBoolean()
  @IsNotEmpty()
  readonly isCredit: boolean;

  @ApiProperty({ description: 'produced year of the trim' })
  @IsBoolean()
  @IsNotEmpty()
  readonly isObmen: boolean;
}


// export class CarListingResponse{
//   @ApiProperty()
//   readonly brand

// }