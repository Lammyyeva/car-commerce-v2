import {
  Controller,
  Get,
  Post,
  Body,
} from '@nestjs/common';
import { BodyTypesService } from './bodyTypes.service';
import { ApiCreatedResponse, ApiOperation } from '@nestjs/swagger';
import { BTypeResponseDto, CreateBTypeDto } from './bodyType.dto';
import { BadRequestError } from 'src/errors';

@Controller('body-types')
export class BodyTypesController {
  constructor(private readonly bodyTypesService: BodyTypesService) {}

  @ApiOperation({ summary: 'it is used to post body type' })
  @ApiCreatedResponse({ type: BTypeResponseDto })
  @Post()
  async create(
    @Body() createBodyTypeDto: CreateBTypeDto,
  ): Promise<BTypeResponseDto> {
    if (!createBodyTypeDto.name) {
      throw new BadRequestError('please provide all credentials');
    }

    const bType = await this.bodyTypesService.create(createBodyTypeDto);

    return bType;
  }

  @ApiOperation({ summary: 'it is used to get all body types' })
  @ApiCreatedResponse({ type: BTypeResponseDto })
  @Get()
  async findAllBTypes(): Promise<BTypeResponseDto[]> {
    const bTypes = await this.bodyTypesService.findAll();

    return bTypes;
  }
}
