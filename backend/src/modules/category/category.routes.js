const express = require('express');
const router = express.Router();

const controller = require('./category.controller');

router.post('/createCategory', controller.createCategory);
router.get('/getCategories', controller.getCategories);
router.put('/updateCategory/:id', controller.updateCategory);
router.delete('/deleteCategory/:id', controller.deleteCategory);
router.get('/tree', controller.getCategoryTree);
module.exports = router;