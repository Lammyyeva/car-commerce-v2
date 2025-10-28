import {
  AutoIncrement,
  BelongsTo,
  Column,
  DataType,
  ForeignKey,
  HasMany,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { Madel } from '../models/model.entity';
import { BodyType } from '../bodyTypes/bodyType.entity';
import { TrimAttributes } from '../trim-attributes/trimAttribute.entity';
import { CarListing } from '../carListing/carListing.entity';
import { Status } from 'src/enum/status.enum';
import { Role } from 'src/enum/roles.enum';

@Table({
  tableName: 'users',
})
export class User extends Model<User> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  name: string;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  password: number;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  gmail: number;

  @Column({
    type: DataType.STRING,
    defaultValue: Role.USER,
  })
  role: Role;

  @BelongsTo(() => Madel)
  model: Madel;

  @Column({
    type: DataType.DATE,
    allowNull: false,
  })
  createdAt: Date;

  @Column({
    type: DataType.DATE,
    allowNull: false,
  })
  updatedAt: Date;

  @HasMany(() => CarListing)
  carListings: CarListing[];
}
