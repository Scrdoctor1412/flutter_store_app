//import the express module
const express = require("express");
const mongoose = require("mongoose");
require("dotenv").config();

const authRouter = require("./routes/auth");
// const helloRoute = require("../routes/hello");

//Define the port number the server will listen on
const PORT = 3000;

//Create an instance of the express application
const app = express();

//mongodb string saves in .env file
const DB = process.env.DB_URL;

//middleware - to register route or to mount routes
// app.use(helloRoute);
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection to MongoDB successful.");
  })
  .catch((e) => {
    console.error("Error connecting to MongoDB:", e);
  });

//start the server and listen to the specified port
app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port ${PORT}`);
});
