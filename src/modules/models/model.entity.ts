import {
  AutoIncrement,
  BelongsTo,
  BelongsToMany,
  Column,
  DataType,
  ForeignKey,
  HasMany,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { Brands } from '../brands/brand.entity';
import { BodyType } from '../bodyTypes/bodyType.entity';
import { ModelBodyType } from '../modelBodyTypes/modelBodyType.entity';
import { Trim } from '../trims/trim.entity';
import { CarListing } from '../carListing/carListing.entity';

@Table({
  tableName: 'models',
})
export class Madel extends Model<Madel> {
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
  year_start: number;

  @Column({
    type: DataType.INTEGER,
  })
  year_end: number;

  @ForeignKey(() => Brands)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
    onDelete: 'CASCADE',
  })
  brand_id: number;

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

  @BelongsTo(() => Brands)
  brand: Brands;

  @BelongsToMany(() => BodyType, () => ModelBodyType)
  bodyTypes: BodyType[];

  @HasMany(() => Trim)
  trims: Trim[];

  @HasMany(() => CarListing)
  carListings: CarListing[];
}
