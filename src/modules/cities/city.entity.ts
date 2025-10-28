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
import { CarListing } from '../carListing/carListing.entity';

@Table({
  tableName: 'cities',
})
export class City extends Model<City> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  name: string;

  @ForeignKey(() => City)
  @Column({
    type: DataType.INTEGER,
    allowNull: true
  })
  parent_id: number | null;

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

  @BelongsTo(() => City)
  parent_city: City;
}
