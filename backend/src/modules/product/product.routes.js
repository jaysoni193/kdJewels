const express = require('express');
const router = express.Router();

const productController = require('./product.controller');

const { verifyToken } = require('../../common/middleware/auth.middleware');
const { authorizeRoles } = require('../../common/middleware/role.middleware');

// PUBLIC ROUTES
router.get('/', productController.getAllProducts);
router.get('/:id', productController.getProductById);

// ADMIN ROUTES
router.post(
  '/',
  verifyToken,
  authorizeRoles('admin'),
  productController.createProduct
);

router.put(
  '/updateProduct',
  verifyToken,
  authorizeRoles('admin'),
  productController.updateProduct
);

router.delete(
  '/deleteProduct',
  verifyToken,
  authorizeRoles('admin'),
  productController.deleteProduct
);

module.exports = router;