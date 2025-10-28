import { HttpException, HttpStatus } from '@nestjs/common';

export class CustomError extends HttpException {
  constructor(message: string | object, statusCode: HttpStatus) {
    super(message, statusCode);
  }
}
