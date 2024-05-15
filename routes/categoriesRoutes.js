const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/categoryController');


router.post('/createCategory', categoryController.createCategory);


router.get('/getAllCategory', categoryController.getAllCategory);


router.get('/category/:id', categoryController.getCategoryById);
router.put('/categoriesPriceUpdate', categoryController.updateCategoryPrices);

router.post('/category/addPrice', categoryController.addCategoryPrice);
router.delete('/category/:id', categoryController.deleteCategoryById);
router.post('/category/getPricesById', categoryController.getCategoryWithPrices);

module.exports = router;
