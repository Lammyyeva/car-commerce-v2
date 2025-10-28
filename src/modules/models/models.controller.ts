import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  ParseIntPipe,
} from '@nestjs/common';
import { ModelsService } from './models.service';
import {
  CreateModelDto,
  ModelResponseDto,
  ModelTrimsByYearResponse,
  ModelWithBTypeResponseDto,
} from './model.dto';
import {
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
} from '@nestjs/swagger';
import { BadRequestError } from 'src/errors';

@Controller('models')
export class ModelsController {
  constructor(private readonly modelsService: ModelsService) {}

  @ApiOperation({ summary: 'it is used to post brand' })
  @ApiCreatedResponse({ type: ModelResponseDto })
  @Post()
  async create(
    @Body() createModelDto: CreateModelDto,
  ): Promise<ModelResponseDto> {
    if (
      !createModelDto.brand_id ||
      !createModelDto.name ||
      !createModelDto.yearStart
    ) {
      throw new BadRequestError('please provide all credentials');
    }

    const modelData = {
      brand_id: createModelDto.brand_id,
      name: createModelDto.name,
      year_start: createModelDto.yearStart,
      year_end: createModelDto?.yearEnd,
    };

    const result = await this.modelsService.create(modelData);

    return new ModelResponseDto(result);
  }

  @ApiOperation({ summary: 'it is used to get all models' })
  @ApiCreatedResponse({ type: ModelResponseDto })
  @Get()
  async findAll(): Promise<ModelResponseDto[]> {
    const results = await this.modelsService.findAll();

    const models = results.map((result) => new ModelResponseDto(result));

    return models;
  }

  @ApiOperation({ summary: 'it is used to get one model' })
  @ApiOkResponse({ type: ModelWithBTypeResponseDto })
  @Get(':id/bodyTypes')
  async findBTypes(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<ModelWithBTypeResponseDto | null> {
    const modelWithBTypes = await this.modelsService.findOneAndBType(id);

    return modelWithBTypes;
  }

  @ApiOperation({ summary: 'it is used to get one model' })
  @ApiOkResponse({ type: ModelTrimsByYearResponse })
  @Get(':id/year/:year/trims')
  async findTrimsByYear(
    @Param('id', ParseIntPipe) id: number,
    @Param('year', ParseIntPipe) year: number,
  ): Promise<ModelTrimsByYearResponse[]> {
    const results = await this.modelsService.findTrims(id, year);

    const trims = results.map((result) => new ModelTrimsByYearResponse(result));

    return trims;
  }

  @ApiOperation({ summary: 'it is used to get one model' })
  @ApiOkResponse({ type: ModelTrimsByYearResponse })
  @Get(':id/year/:year/trims/btypeId')
  async findTrimsByYearPerBType(
    @Param('id', ParseIntPipe) id: number,
    @Param('year', ParseIntPipe) year: number,
    @Param('bTYpeId', ParseIntPipe) bTypeId: number,
  ): Promise<ModelTrimsByYearResponse[]> {
    const results = await this.modelsService.findTrimsPerBType(
      id,
      year,
      bTypeId,
    );

    const trimsOfBType = results.map(
      (result) => new ModelTrimsByYearResponse(result),
    );

    return trimsOfBType;
  }
}
