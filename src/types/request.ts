import { Request } from 'express';
import { UserResponseDto } from 'src/modules/users/user.dto';

export interface RequestBody extends Request {
  user?: UserResponseDto;
}
