import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ColorsService } from './colors.service';
import { ColorResponseDto, CreateColorDto } from './colors.dto';
import {
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
} from '@nestjs/swagger';
import { Color } from './color.entity';
import { BadRequestError } from 'src/errors';

@Controller('colors')
export class ColorsController {
  constructor(private readonly colorsService: ColorsService) {}

  @ApiOperation({ summary: 'it is used to post color' })
  @ApiCreatedResponse()
  @Post()
  async createColor(@Body() createColorDto: CreateColorDto): Promise<Color> {
    if (!createColorDto.value) {
      throw new BadRequestError('please provide all credentials');
    }
    return await this.colorsService.create(createColorDto);
  }

  @ApiOperation({ summary: 'it is used to get all colors' })
  @ApiOkResponse({ type: ColorResponseDto })
  @Get()
  async findColorLists(): Promise<ColorResponseDto[]> {
    const results = await this.colorsService.findAllColors();

    const colors = results.map((result) => new ColorResponseDto(result));

    return colors;
  }

  // @Get(':id')
  // findOne(@Param('id') id: string) {
  //   return this.colorsService.findOne(+id);
  // }

  // @Patch(':id')
  // update(@Param('id') id: string, @Body() updateColorDto: UpdateColorDto) {
  //   return this.colorsService.update(+id, updateColorDto);
  // }

  // @Delete(':id')
  // remove(@Param('id') id: string) {
  //   return this.colorsService.remove(+id);
  // }
}
