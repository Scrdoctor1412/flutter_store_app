const express = require('express')
const SubCategory = require("../models/sub_category");

const subCategoryRouter = express.Router();

subCategoryRouter.post("/api/subcategories", async (req, res) => {
    try {
        const { categoryId, categoryName, image, subCategoryName } = req.body;
        const subCategory = new SubCategory({ categoryId, categoryName, image, subCategoryName });
        await subCategory.save();
        return res.status(201).send(subCategory);
    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
})

module.exports = subCategoryRouter;