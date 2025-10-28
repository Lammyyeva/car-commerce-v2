import {
  AutoIncrement,
  BelongsToMany,
  Column,
  DataType,
  HasMany,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { ModelBodyType } from '../modelBodyTypes/modelBodyType.entity';
import { Madel } from '../models/model.entity';
import { Trim } from '../trims/trim.entity';
import { CarListing } from '../carListing/carListing.entity';

@Table({
  tableName: 'body_types',
})
export class BodyType extends Model<BodyType> {
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
    type: DataType.DATE,
    allowNull: false,
  })
  createdAt: Date;

  @Column({
    type: DataType.DATE,
    allowNull: false,
  })
  updatedAt: Date;

  @BelongsToMany(() => Madel, () => ModelBodyType)
  models: Madel[];

  @HasMany(() => Trim)
  trims: Trim[];

  @HasMany(() => CarListing)
  carListings: CarListing[];
}
