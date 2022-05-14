// External dependencies
import Connection from "../services/database-service";
import * as dotenv from "dotenv";

dotenv.config({ path: "./../.env" });

// console.log(process.env.HOST_NAME)

var Sequelize = require("sequelize");
var sequelize = Connection.connectToDatabase();

// Connection.authenticateConnection()
// Class Implementation
export default class Models {
  // Payment table implementation
  static readonly Payment = sequelize.define(
    "Payment",
    {
      paymentID: { type: Sequelize.UUID, primaryKey: true },
      userID: Sequelize.UUID,
      serviceProviderID: Sequelize.UUID,
      paymentMethod: Sequelize.TEXT,
      paymentType: Sequelize.TEXT,
      paymentInvoice: Sequelize.TEXT,
      timeCreated: Sequelize.DATE,
    },
    { freezeTableName: true }
  );
  // ServiceCategory table implementation
  static readonly ServiceCategory = sequelize.define(
    "ServiceCategory",
    {
      serviceCategoryID: { type: Sequelize.UUID, primaryKey: true },
      serviceCategoryName: Sequelize.TEXT,
    },
    { freezeTableName: true }
  );
  // NewsLetter table implementation
  static readonly NewsLetter = sequelize.define(
    "NewsLetter",
    {
      newsletterID: { type: Sequelize.UUID, primaryKey: true },
      userID: Sequelize.UUID,
      newsletterTitle: Sequelize.TEXT,
      newsletterBody: Sequelize.TEXT,
    },
    { freezeTableName: true }
  );
  // ServiceProviderRating table implementation
  static readonly ServiceProviderRating = sequelize.define(
    "Service_Provider_Rating",
    {
      serviceProviderRatingID: { type: Sequelize.UUID, primaryKey: true },
      userID: Sequelize.UUID,
      serviceProviderID: Sequelize.UUID,
      rating: Sequelize.INTEGER,
    },
    { freezeTableName: true }
  );

  static readonly ServiceProviderReview = sequelize.define(
    "Service_Provider_Review",
    {
      serviceProviderReviewID: { type: Sequelize.UUID, primaryKey: true },
      userID: Sequelize.UUID,
      serviceProviderID: Sequelize.UUID,
      serviceProviderReviewBody: Sequelize.TEXT,
      isDeleted: { type: Sequelize.BOOLEAN, default: 0 },
      timeCreated: Sequelize.DATE,
      timeUpdated: Sequelize.DATE,
      timeDeleted: Sequelize.DATE
    },
    { freezeTableName: true }
  );
}

// { force: true }
