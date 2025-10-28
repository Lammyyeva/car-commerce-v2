import { ApiProperty } from '@nestjs/swagger';
import { Role } from 'src/enum/roles.enum';
import { IUserRepo } from 'src/types/uset';

export class UserResponseDto {
  @ApiProperty()
  readonly id: number;

  @ApiProperty()
  readonly name: string;

  @ApiProperty()
  readonly gmail: string;

  @ApiProperty()
  readonly role: Role;

  constructor(model: IUserRepo) {
    this.id = model.id;
    this.name = model.name;
    this.gmail = model.gmail;
    this.role = model.role;
  }
}
