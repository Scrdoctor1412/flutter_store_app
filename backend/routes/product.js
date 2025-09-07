const express = require("express");
const Product = require("../models/product");

const productRouter = express.Router();

productRouter.post("/api/add-product", async (req, res) => {
  try {
    const {
      productName,
      productPrice,
      quantity,
      description,
      category,
      subCategory,
      images,
      popular,
      recommend,
    } = req.body;

    const product = new Product({
      productName,
      productPrice,
      quantity,
      description,
      category,
      subCategory,
      images,
      popular,
      recommend,
    });
    await product.save();
    return res.status(201).send(product);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
});

productRouter.get("/api/popular-prodcuts", async (req, res) => {
  try {
    const products = await Product.find({ popular: true });
    if (!products || products.length === 0) {
      return res.status(404).json({ message: "No popular products found" });
    }
    return res.status(200).send(products);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
});

productRouter.get("/api/recommended-prodcuts", async (req, res) => {
  try {
    const products = await Product.find({ recommend: true });
    if (!products || products.length === 0) {
      return res.status(404).json({ message: "No recommend products found" });
    }
    return res.status(200).send(products);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
});

module.exports = productRouter;
