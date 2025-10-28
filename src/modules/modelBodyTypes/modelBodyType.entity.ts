import {
  Column,
  DataType,
  ForeignKey,
  Model,
  PrimaryKey,
  Table,
} from 'sequelize-typescript';
import { Madel } from '../models/model.entity';
import { BodyType } from '../bodyTypes/bodyType.entity';

@Table({
  tableName: 'model_body_types',
})
export class ModelBodyType extends Model<ModelBodyType> {
  @ForeignKey(() => Madel)
  @PrimaryKey
  @Column({
    type: DataType.INTEGER,
    allowNull: false
  })
  model_id: number;

  @Column({
    type: DataType.DATE,
    allowNull: false
  })
  createdAt: Date; 

  @Column({
    type: DataType.DATE,
    allowNull: false
  })
  updatedAt: Date; 

  @ForeignKey(() => BodyType)
  @PrimaryKey
  @Column({
    type: DataType.INTEGER,
    allowNull: false
  })
  body_type_id: number;
}
