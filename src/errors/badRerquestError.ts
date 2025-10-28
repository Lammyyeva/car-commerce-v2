import { HttpStatus } from '@nestjs/common';
import { CustomError } from './customErros';

export class BadRequestError extends CustomError {
  constructor(message: string) {
    super(message, HttpStatus.BAD_REQUEST);
  }
}
