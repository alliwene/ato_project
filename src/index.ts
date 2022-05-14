import * as express from "express";
// import Models from "./models/read_db";
// import * as dotenv from "dotenv";
import Connection from "./services/database-service";
// import { Request, Response } from "express";
import { testsRouter } from "./routes/test.router";
import * as bodyParser from "body-parser";
import * as cors from "cors";

// dotenv.config({path: '../.env'});

const app = express();
const port = 8080; // default port to listen

app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
app.use(cors());

var sequelize = Connection.connectToDatabase();
Connection.authenticateConnection();

sequelize.sync().then(() => {
  try {
    app.use("/tests", testsRouter);
    app.listen(port, () => {
      console.log(`Server started at http://localhost:${port}`);
    });
  } catch (error) {
    console.error("Database connection failed", error);
    process.exit();
  }
});
