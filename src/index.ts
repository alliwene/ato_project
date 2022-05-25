import "reflect-metadata";
import express, { Application } from "express";
import { testsRouter } from "./routes/test.router";
import * as dotenv from "dotenv";
import { Connection } from "./services/connection";
import * as bodyParser from "body-parser";
import cors from "cors";

dotenv.config({ path: "./.env" });

const app: Application = express();
const port = 8080; // default port to listen

app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
app.use(cors());

var sequelize = Connection.connectToDatabase();

// sequelize.sync().then(() =>
const start = async (): Promise<void> => {
  try {
    await sequelize.sync();
    // dbInit();
    app.use("/tests", testsRouter);
    app.listen(port, () => {
      console.log(`Server started at http://localhost:${port}`);
    });
  } catch (error) {
    console.error("Database connection failed", error);
    process.exit(1);
  }
};

void start();

// { alter: true }
