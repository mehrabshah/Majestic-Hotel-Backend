const express = require('express');
const router = express.Router();
const contactUsController = require('../controllers/categoryController');


router.post('/createCategory', contactUsController.createCategory);


router.get('/getAllCategory', contactUsController.getAllCategory);


router.get('/category/:id', contactUsController.getCategoryById);
router.put('/categoriesPriceUpdate', contactUsController.updateCategoryPrices);


router.delete('/category/:id', contactUsController.deleteCategoryById);

module.exports = router;
