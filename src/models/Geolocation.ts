// External dependencies
import {
    Table,
    Model,
    Column,
    DataType,
    BelongsTo,
    ForeignKey,
  } from "sequelize-typescript";
  // import { BelongsToGetAssociationMixin, ForeignKey } from "sequelize/types";
  import { v4 as uuidv4 } from "uuid";
  import Customer  from "./Customer";
  @Table({
    timestamps: false,
    tableName: "Geolocation",
    freezeTableName: true,
  })
  export default class Geolocation extends Model {
    @ForeignKey(() => Customer)
    @Column({
      type: DataType.UUID,
      defaultValue: DataType.UUIDV4,
      primaryKey: true,
      allowNull: false,
    })
    declare public geolocationID: typeof uuidv4;
  
    @Column({
      type: DataType.DECIMAL(12, 9),
      allowNull: false,
    })
    declare public longitude: number;

    @Column({
        type: DataType.DECIMAL(12, 9),
        allowNull: false,
      })
    declare public latitude: number;
  
    @BelongsTo(() => Customer)
    customer!: Customer;
    
  }