import {
  AutoIncrement,
  BelongsTo,
  Column,
  DataType,
  ForeignKey,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { Brands } from '../brands/brand.entity';
import { BodyType } from '../bodyTypes/bodyType.entity';
import { Trim } from '../trims/trim.entity';
import { Color } from '../colors/color.entity';
import { City } from '../cities/city.entity';
import { Madel } from '../models/model.entity';
import { User } from '../users/user.entity';

@Table({
  tableName: 'models',
})
export class CarListing extends Model<CarListing> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @ForeignKey(() => Brands)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  brand_id: number;

  @BelongsTo(() => Brands)
  brand: Brands;

  @ForeignKey(() => Madel)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  model_id: number;

  @ForeignKey(() => BodyType)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  bType_id: number;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  year: number;

  @ForeignKey(() => Trim)
  @Column({
    type: DataType.INTEGER,
  })
  trim_id: number;

  @ForeignKey(() => Color)
  @Column({
    type: DataType.INTEGER,
  })
  color_id: number;

  @ForeignKey(() => City)
  @Column({
    type: DataType.INTEGER,
  })
  city_id: number;

  @ForeignKey(() => User)
  @Column({
    type: DataType.INTEGER,
  })
  user_id: number;

  @Column({
    type: DataType.INTEGER,
  })
  price: number;

  @Column({
    type: DataType.STRING,
  })
  vin: string;

  @Column({
    type: DataType.BOOLEAN,
    defaultValue: false,
  })
  isCredit: boolean;

  @Column({
    type: DataType.BOOLEAN,
    defaultValue: false,
  })
  isObmen: boolean;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  phone: string;

  @Column({
    type: DataType.INTEGER,
    defaultValue: 0,
  })
  probeg: number;

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

  @BelongsTo(() => Madel)
  model: Madel;

  @BelongsTo(() => Trim)
  trim: Trim;

  @BelongsTo(() => Color)
  color: Color;

  @BelongsTo(() => City)
  city: City;

  @BelongsTo(() => BodyType)
  bType: BodyType;

  @BelongsTo(() => User)
  user: User;
}
