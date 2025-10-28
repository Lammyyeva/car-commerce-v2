import {
  AutoIncrement,
  Column,
  DataType,
  HasMany,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { Madel } from '../models/model.entity';
import { CarListing } from '../carListing/carListing.entity';

@Table({
  tableName: 'brands',
})
export class Brands extends Model<Brands> {
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
    type: DataType.STRING,
    allowNull: false,
  })
  image_url: string; // brand image ucin ayratyn table doretmage wagtym bolmady

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

  @HasMany(() => Madel)
  models: Madel[];

  @HasMany(() => CarListing)
  carListings: CarListing[];
}
