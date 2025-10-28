import { HttpStatus } from '@nestjs/common';
import { CustomError } from './customErros';

export class UnAuthorizedError extends CustomError {
  constructor(message: string) {
    super(message, HttpStatus.UNAUTHORIZED);
  }
}
