// External Dependencies
import { Sequelize } from "sequelize-typescript";
import { Customer } from "../models/customer";

// Initialize Connection
export class Connection {
  public static connectToDatabase() {
    var dbUser = process.env.DB_USER as string;
    var dbPassword = process.env.DB_PASSWORD;
    var dbHost = process.env.DB_HOST;
    var dbName = process.env.DB_NAME as string;

    // Initialize Sequelize to connect to database
    var connection = new Sequelize(dbName, dbUser, dbPassword, {
      dialect: "mssql",
      host: dbHost,
      port: 1433, // Default port
      logging: false, // disable logging; default: console.log
      models: [Customer],
      dialectOptions: {
        requestTimeout: 30000, // timeout = 30 seconds
      },
    });

    connection
      .authenticate()
      .then(() => {
        console.log("Database connected...");
      })
      .catch((err: any) => {
        console.error("Unable to connect to the database:", err);
      });
    return connection;
  }
}
