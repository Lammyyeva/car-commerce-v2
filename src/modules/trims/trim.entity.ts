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
import { Madel } from '../models/model.entity';
import { BodyType } from '../bodyTypes/bodyType.entity';
import { TrimAttributes } from '../trim-attributes/trimAttribute.entity';
import { CarListing } from '../carListing/carListing.entity';

@Table({
  tableName: 'trims',
})
export class Trim extends Model<Trim> {
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
  year: number;

  @ForeignKey(() => Madel)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  model_id: number;

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

  @ForeignKey(() => BodyType)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  bType_id: number;

  @BelongsTo(() => BodyType)
  bType: BodyType;

  @HasMany(() => TrimAttributes)
  attributes: TrimAttributes[];

  @HasMany(() => CarListing)
  carListings: CarListing[];
}
