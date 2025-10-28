import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ModelBodyTypesService } from './modelBodyTypes.service';
import { ApiCreatedResponse, ApiOperation } from '@nestjs/swagger';
import { CreateModelBTypeDto, ModelBTypeResponseDto } from './modelBType.dto';
import { BadRequestError } from 'src/errors';

@Controller('modelBTypes')
export class ModelBodyTypesController {
  constructor(private readonly modelBodyTypesService: ModelBodyTypesService) {}

  @ApiOperation({ summary: 'it is used to post brand' })
  @ApiCreatedResponse({ type: ModelBTypeResponseDto })
  @Post()
  async create(
    @Body() createModelBTypeDto: CreateModelBTypeDto,
  ): Promise<ModelBTypeResponseDto> {
    if (!createModelBTypeDto.bTypeId || !createModelBTypeDto.modelId) {
      throw new BadRequestError('please provide all credentials');
    }

    const modelBtypeData = {
      model_id: createModelBTypeDto.modelId,
      body_type_id: createModelBTypeDto.bTypeId,
    };

    const result = await this.modelBodyTypesService.create(modelBtypeData);

    return new ModelBTypeResponseDto(result);
  }

  // @ApiOperation({ summary: 'it is used to get all ' })
  // @ApiCreatedResponse({ type: ModelBTypeResponseDto })
  // @Get()
  // findAll() {
  //   return this.modelBodyTypesService.findAll();
  // }

  // @Get(':id')
  // findOne(@Param('id') id: string) {
  //   return this.modelBodyTypesService.findOne(+id);
  // }

  // @Patch(':id')
  // update(
  //   @Param('id') id: string,
  //   @Body() updateModelBodyTypeDto: UpdateModelBodyTypeDto,
  // ) {
  //   return this.modelBodyTypesService.update(+id, updateModelBodyTypeDto);
  // }

  // @Delete(':id')
  // remove(@Param('id') id: string) {
  //   return this.modelBodyTypesService.remove(+id);
  // }
}
