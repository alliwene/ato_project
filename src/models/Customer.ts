// External dependencies
import {
  Table,
  Model,
  Column,
  DataType,
  Sequelize,
  HasOne
} from "sequelize-typescript";
import { v4 as uuidv4 } from "uuid";
import CustomerType  from "./CustomerType";
import Geolocation from "./Geolocation";

@Table({
  timestamps: false,
  tableName: "Customer",
  freezeTableName: true,
})
export default class Customer extends Model {
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
    primaryKey: true,
    allowNull: false,
  })
  declare public customerID: typeof uuidv4;

  // @Column({
  //   type: DataType.UUID,
  //   defaultValue: DataType.UUIDV4,
  //   allowNull: false
  // })
  // declare public customerTypeID: typeof uuidv4;

  // @Column({
  //   type: DataType.UUID,
  //   defaultValue: DataType.UUIDV4,
  //   allowNull: false,
  // })
  // declare public customerVerificationID: typeof uuidv4;

  // @Column({
  //   type: DataType.UUID,
  //   defaultValue: DataType.UUIDV4,
  //   allowNull: false,
  // })
  // declare public geolocationID: typeof uuidv4;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  declare public customerName: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
    unique: true,
  })
  declare public customerEmailAddress: string;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  declare public customerAddress: string;

  @Column({
    type: DataType.STRING,
    allowNull: true,
  })
  declare public customerHomePhone: string;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  declare public customerGender: string;

  @Column({
    type: DataType.INTEGER,
    allowNull: false,
  })
  declare public customerAge: number;

  @Column({
    type: DataType.STRING,
    allowNull: false,
  })
  declare public customerPersonalPhone: string;

  @Column({
    type: DataType.TEXT,
    allowNull: false,
  })
  declare public customerOccupation: string;

  @Column({
    type: DataType.BOOLEAN,
    allowNull: false,
    defaultValue: false,
  })
  declare public isDeleted: boolean;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    defaultValue: Sequelize.fn("GETDATE"),
  })
  declare public timeCreated: Date;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    defaultValue: Sequelize.fn("GETDATE"),
  })
  declare public timeUpdated: Date;

  @Column({
    type: DataType.DATE,
    allowNull: true,
  })
  declare public timeDeleted: Date;

  @HasOne(() => CustomerType, {
    foreignKey: {
      name: "customerTypeID",
      allowNull: false
    },
  })
  customer_type!: CustomerType;

  @HasOne(() => Geolocation, {
    foreignKey: {
      name: "geolocationID",
      allowNull: false
    },
  })
  geolocation!: Geolocation;
 
}




// { force: true }
