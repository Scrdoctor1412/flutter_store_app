const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { fullName, email, password } = req.body;
    const existingEmail = await User.findOne({ email });
    if (existingEmail) {
      return res
        .status(400)
        .json({ message: "User with same email already exist" });
    } else {
      //generate a salt with a cost factor of 10
      const salt = await bcrypt.genSalt(10);
      //hash the password using the generated salt
      const hashedPassword = await bcrypt.hash(password, salt);

      let newUser = new User({
        fullName,
        email,
        password: hashedPassword,
      });
      newUser = await newUser.save();
      res.json(newUser);
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//signin api endpoint
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const findUser = await User.findOne({ email });
    if (!findUser) {
      return res
        .status(400)
        .json({ message: "User not found with this email" });
    } else {
      const isPasswordValid = await bcrypt.compare(password, findUser.password);
      if (!isPasswordValid) {
        return res.status(400).json({ message: "Incorrect password" });
      } else {
        const token = jwt.sign({ id: findUser._id }, "passwordKey");

        //remove sensitive information
        const { password, ...userWithoutPassword } = findUser._doc; //._doc is refer to the User it self

        return res.json({ token, ...userWithoutPassword });
      }
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
