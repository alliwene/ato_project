// External Dependencies
// import * as mongoDB from "mongodb";
import * as dotenv from "dotenv";
var Sequelize = require("sequelize");

// Initialize Connection

export default class Connection {
  public static connectToDatabase() {
    var userName = process.env.USER_NAME;
    var password = process.env.PASS_WORD;
    var hostName = process.env.HOST_NAME;
    var sampleDbName = process.env.DB_NAME;

    // Initialize Sequelize to connect to sample DB
    var sampleDb = new Sequelize(sampleDbName, userName, password, {
      dialect: "mssql",
      host: hostName,
      port: 1433, // Default port
      logging: false, // disable logging; default: console.log

      dialectOptions: {
        requestTimeout: 30000, // timeout = 30 seconds
      },
    });
    return sampleDb;
  }
  public static authenticateConnection(): any {
    // dotenv.config({path: '../.env'});
    var workerDb = this.connectToDatabase();

    workerDb
      .authenticate()
      .then(() => {
        console.log("Database connected...");
      })
      .catch((err: any) => {
        console.error("Unable to connect to the database:", err);
      });
  }
}

// connectToDatabase()
