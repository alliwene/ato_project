// External Dependencies
import { Console } from "console";
import * as express from "express";
import { Request, Response } from "express";
// import * as dotenv from "dotenv";
import Models from "../models/read_db";
// import  Connection  from "../services/database-service";

function removeAttribute(attribute){
    attribute.removeAttribute("createdAt")
    attribute.removeAttribute("updatedAt")
    return attribute
}

const Payment = removeAttribute(Models.Payment);


// Global Config
export const testsRouter = express.Router();
testsRouter.use(express.json());

// GET
testsRouter.get("/payment", async (_req: Request, res: Response) => {
  try {
    Payment.findAll().then((Payment: any) => res.json(Payment));
  } catch (error) {
    res.status(500).send(error.message);
  }
});

testsRouter.get("/payment/:id", async (req: Request, res: Response) => {
  try {
    Payment.findByPk(req.params.id).then((Payment: any) => res.json(Payment));
  } catch (error) {
    res
      .status(404)
      .send(`Unable to find matching document with id: ${req.params.id}`);
  }
});

// Payment.findAll({ where: { paymentID: req.params.id } }).then((Payment: any) => res.json(Payment));

// testsRouter.get("/:id", async (req: Request, res: Response) => {
//     const id = req?.params?.id;

//     try {

//         const query = { _id: new ObjectId(id) };
//         const test = (await collections.tests.findOne(query)) as unknown as Connect;

//         if (test) {
//             res.status(200).send(test);
//         }
//     } catch (error) {
//         res.status(404).send(`Unable to find matching document with id: ${req.params.id}`);
//     }
// });

// // POST
// testsRouter.post("/", async (req: Request, res: Response) => {
//     try {
//         const newTest = req.body as Connect;
//         const result = await collections.tests.insertOne(newTest);

//         result
//             ? res.status(201).send(`Successfully created a new test with id ${result.insertedId}`)
//             : res.status(500).send("Failed to create a new test.");
//     } catch (error) {
//         console.error(error);
//         res.status(400).send(error.message);
//     }
// });

// // PUT
// testsRouter.put("/:id", async (req: Request, res: Response) => {
//     const id = req?.params?.id;

//     try {
//         const updatedGame: Connect = req.body as Connect;
//         const query = { _id: new ObjectId(id) };

//         const result = await collections.tests.updateOne(query, { $set: updatedGame });

//         result
//             ? res.status(200).send(`Successfully updated test with id ${id}`)
//             : res.status(304).send(`Test with id: ${id} not updated`);
//     } catch (error) {
//         console.error(error.message);
//         res.status(400).send(error.message);
//     }
// });

// // DELETE
// testsRouter.delete("/:id", async (req: Request, res: Response) => {
//     const id = req?.params?.id;

//     try {
//         const query = { _id: new ObjectId(id) };
//         const result = await collections.tests.deleteOne(query);

//         if (result && result.deletedCount) {
//             res.status(202).send(`Successfully removed test with id ${id}`);
//         } else if (!result) {
//             res.status(400).send(`Failed to test game with id ${id}`);
//         } else if (!result.deletedCount) {
//             res.status(404).send(`Test with id ${id} does not exist`);
//         }
//     } catch (error) {
//         console.error(error.message);
//         res.status(400).send(error.message);
//     }
// });
