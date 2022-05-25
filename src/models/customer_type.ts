// External dependencies
import {
  Table,
  Model,
  Column,
  DataType,
  Sequelize,
} from "sequelize-typescript";
import { v4 as uuidv4 } from "uuid";
@Table({
  timestamps: false,
  tableName: "CustomerType",
  freezeTableName: true,
})
export class CustomerType extends Model<CustomerType> {
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  public declare customerTypeID: typeof uuidv4;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  public declare customerTypeName: string;
}

// { force: true }
