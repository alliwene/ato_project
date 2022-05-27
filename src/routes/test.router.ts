// External Dependencies
import bodyParser from "body-parser";
import * as express from "express";
import { Request, Response } from "express";
import Customer  from "../models/Customer";
import CustomerType from "../models/CustomerType";

// import Connection   from "../services/connection";
// dotenv.config({ path: "./.env" });
// var sequelize = Connection.connectToDatabase();
// const customerRepository = sequelize.getRepository(Customer)
// const customerTypeRepository = sequelize.getRepository(CustomerType)

// Global Config
export const testsRouter = express.Router();
testsRouter.use(express.json());


// Function to parse error messages
function getErrorMessage(error: unknown) {
  if (error instanceof Error) return error.message;
  return String(error);
}

// GET all customers
testsRouter.get(
  "/customer",
  async (_req: Request, res: Response): Promise<Response> => {
    try {
      const allCustomers: Customer[] = await Customer.findAll(
        { include: { model: CustomerType, as: "customer_type" } }
      );
      return res.status(200).json(allCustomers);
    } catch (error) {
      return res.status(500).send(getErrorMessage(error));
    }
  }
);


// POST a customer
testsRouter.post(
  "/customer",
  async (req: Request, res: Response): Promise<Response> => {
    try {
      // const customerType = req.body.customer_type;
      const customer: Customer = await Customer.create(
        { ...req.body },
        { include: { model: CustomerType, as: "customer_type" } },
      );
      return res.status(201).json(customer);
    } catch (error) {
      console.error(error);
      return res.status(400).send(getErrorMessage(error));
    }
  }
);



testsRouter.post(
  "/customertype",
  async (req: Request, res: Response): Promise<Response> => {
    try {
      const customer_type: CustomerType = await CustomerType.create(
        { ...req.body },
        // { include: [{ model: CustomerType, as: "customer_type" }] }
      );
      return res.status(201).json(customer_type);
    } catch (error) {
      console.error(error);
      return res.status(400).send(getErrorMessage(error));
    }
  }
);

// GET
// testsRouter.get("/payment", async (_req: Request, res: Response) => {
//   try {
//     Payment.findAll().then((Payment: any) => res.json(Payment));
//   } catch (error) {
//     res.status(500).send(error.message);
//   }
// });

// // Read entities using WHERE and AND
// testsRouter.get("/payment/search", async (req: Request, res: Response) => {
//   Payment.findAll({
//     where: { paymentMethod: req.query.method, paymentType: req.query.type },
//   }).then((Payment: any) => res.json(Payment));
// });

// // Get by id
// testsRouter.get("/payment/:id", async (req: Request, res: Response) => {
//   try {
//     Payment.findByPk(req.params.id).then((Payment: any) => res.json(Payment));
//   } catch (error) {
//     res
//       .status(404)
//       .send(`Unable to find matching document with id: ${req.params.id}`);
//   }
// });

// testsRouter.post('/customer', async (req: Request, res: Response) => {
//   Note.create({ note: req.body.note, tag: req.body.tag }).then((Payment: any) {
//     res.json(note);
//   });
// });

//

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
