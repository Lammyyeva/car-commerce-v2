import {
  AutoIncrement,
  Column,
  DataType,
  HasMany,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { CarListing } from '../carListing/carListing.entity';

@Table({
  tableName: 'colors',
})
export class Color extends Model<Color> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  value: string;

  @HasMany(() => CarListing)
  carListings: CarListing[];
}
