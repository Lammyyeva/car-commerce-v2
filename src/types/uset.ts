import { Role } from 'src/enum/roles.enum';

export interface IUserRepo {
  id: number;
  name: string;
  gmail: string;
  password: string;
  role: Role;
  createdAt: Date;
  updatedAt: Date;
}
