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
  tableName: "Customer",
  freezeTableName: true,
})
export class Customer extends Model<Customer> {
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    primaryKey: true,
    allowNull: false,
  })
  public declare customerID: typeof uuidv4;

  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  public declare customerTypeID: typeof uuidv4;

  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  public declare customerVerificationID: typeof uuidv4;

  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    allowNull: false,
  })
  public declare geolocationID: typeof uuidv4;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  public declare customerName: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
  })
  public declare customerEmailAddress: string;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  public declare customerAddress: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  public declare customerHomePhone: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  public declare customerGender: string;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  public declare customerAge: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  public declare customerPersonalPhone: string;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  public declare customerOccupation: string;

  @Column({
    type: DataType.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  })
  public declare isDeleted: boolean;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    defaultValue: Sequelize.fn("GETDATE"),
  })
  public declare timeCreated: Date;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    defaultValue: Sequelize.fn("GETDATE"),
  })
  public declare timeUpdated: Date;

  @Column({
    type: DataType.DATE,
    allowNull: true,
  })
  public declare timeDeleted: Date;
}

// Customer
// { force: true }
