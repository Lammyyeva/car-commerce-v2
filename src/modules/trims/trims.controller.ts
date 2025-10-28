import { Controller, Post, Body } from '@nestjs/common';
import { TrimsService } from './trims.service';
import { ApiCreatedResponse, ApiOperation } from '@nestjs/swagger';
import { CreateTrimDto, CreateTrimResponseDto } from './trim.dto';

@Controller('trims')
export class TrimsController {
  constructor(private readonly trimsService: TrimsService) {}

  @ApiOperation({ summary: 'it is used to post trim' })
  @ApiCreatedResponse({ type: CreateTrimResponseDto })
  @Post()
  async create(
    @Body() createTrimDto: CreateTrimDto,
  ): Promise<CreateTrimResponseDto> {
    const result = await this.trimsService.create(createTrimDto);

    const trim = new CreateTrimResponseDto(result);

    return trim;
  }
}
