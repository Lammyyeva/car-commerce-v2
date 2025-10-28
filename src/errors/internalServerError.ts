import { HttpStatus } from '@nestjs/common';
import { CustomError } from './customErros';

export class InternalServerError extends CustomError {
  constructor(message: object) {
    super(message, HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
