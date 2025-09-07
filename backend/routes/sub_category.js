const express = require("express");
const SubCategory = require("../models/sub_category");

const subCategoryRouter = express.Router();

subCategoryRouter.post("/api/subcategories", async (req, res) => {
  try {
    const { categoryId, categoryName, image, subCategoryName } = req.body;
    const subCategory = new SubCategory({
      categoryId,
      categoryName,
      image,
      subCategoryName,
    });
    await subCategory.save();
    return res.status(201).send(subCategory);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
});

subCategoryRouter.get(
  "/api/category/:categoryName/subcategories",
  async (req, res) => {
    try {
      ///extract the categoryName from the request URL using Destructuring
      const { categoryName } = req.params;
      const subCategories = await SubCategory.find({ categoryName });

      //check if any subcategories were found
      if (!subCategories || subCategories.length === 0) {
        //if no subcategories are found, respond with a status 404
        return res.status(404).json({ message: "subcategories not found" });
      } else {
        return res.status(200).send(subCategories);
      }
    } catch (error) {
      return res.status(500).json({ error: error.message });
    }
  }
);

module.exports = subCategoryRouter;
