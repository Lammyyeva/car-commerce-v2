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

import { Trim } from '../trims/trim.entity';

@Table({
  tableName: 'trims',
})
export class TrimAttributes extends Model<TrimAttributes> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  capacity: number;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  horse_power: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  transmission_type: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  drive_type: string;

  @ForeignKey(() => Trim)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  trim_id: number;

  @BelongsTo(() => Trim)
  trim: Trim;
}
