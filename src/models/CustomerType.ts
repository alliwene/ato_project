// External dependencies
import {
  Table,
  Model,
  Column,
  DataType,
  BelongsTo,
  ForeignKey,
  AllowNull,
} from "sequelize-typescript";
// import { BelongsToGetAssociationMixin, ForeignKey } from "sequelize/types";
import { v4 as uuidv4 } from "uuid";
import Customer from "./Customer";
@Table({
  timestamps: false,
  tableName: "CustomerType",
  freezeTableName: true,
})
export default class CustomerType extends Model {
  @ForeignKey(() => Customer)
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    primaryKey: true,
    allowNull: false,
  })
  public declare customerTypeID: typeof uuidv4;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  public declare customerTypeName: string;

  @BelongsTo(() => Customer, {
    targetKey: "customerID",
    foreignKey: {
      name: "customerTypeID",
      allowNull: false,
    },
  })
  customer!: Customer;
}

// { force: true }
