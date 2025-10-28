import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  ParseIntPipe,
  Req,
} from '@nestjs/common';
import { CarListingService } from './carListing.service';
import { CreateCarListingDto } from './carListing.dto';
import {
  ApiCreatedResponse,
  ApiOkResponse,
  ApiOperation,
} from '@nestjs/swagger';
import { CarListing } from './carListing.entity';
import { RequestBody } from 'src/types/request';

@Controller('carListing')
export class CarListingController {
  constructor(private readonly carListingService: CarListingService) {}

  @ApiOperation({ summary: 'it is used to post body type' })
  @ApiCreatedResponse()
  @Post()
  async create(
    @Body() createCarListingDto: CreateCarListingDto,
  ): Promise<CarListing> {
    const carList = await this.carListingService.create(createCarListingDto);

    return carList;
  }

  @ApiOperation({ summary: 'it is used to post body type' })
  @ApiOkResponse()
  @Get()
  findAll(): Promise<CarListing[]> {
    return this.carListingService.findAll();
  }

  @ApiOperation({ summary: 'it is used to post body type' })
  @ApiOkResponse()
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number): Promise<CarListing | null> {
    return this.carListingService.findOne(id);
  }

  @ApiOperation({ summary: 'it is used to post body type' })
  @ApiOkResponse()
  @Get()
  findOneByUserId(@Req() req: RequestBody): Promise<CarListing | null> {
    const userId = req!.user!.id;
    return this.carListingService.profileCars(userId);
  }
}
