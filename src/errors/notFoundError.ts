import { HttpStatus } from '@nestjs/common';
import { CustomError } from './customErros';

export class NotFoundError extends CustomError {
  constructor(message: string) {
    super(message, HttpStatus.NOT_FOUND);
  }
}
