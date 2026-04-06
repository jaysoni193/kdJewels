const express = require('express');
const router = express.Router();

const productController = require('./product.controller');

const { verifyToken } = require('../../common/middleware/auth.middleware');
const { authorizeRoles } = require('../../common/middleware/role.middleware');
const upload = require('../../common/middleware/multer.middleware');

// ================= PUBLIC ROUTES =================

router.get('/getAllProducts', productController.getAllProducts);

// Get Single Product
router.get('/getProductById/:id', productController.getProductById);

router.post('/search', productController.searchProducts);

router.post('/filter', productController.filterProducts);

// ================= ADMIN ROUTES =================

// Create Product
router.post(
  '/createProduct',
  verifyToken,
  authorizeRoles('admin'),
  upload.array('images', 5),
  productController.createProduct
);

// Update Product
router.put(
  '/updateProduct',
  verifyToken,
  authorizeRoles('admin'),
  upload.array('images', 5),
  productController.updateProduct
);

// Soft Delete Product
router.put('/softDelete', verifyToken, authorizeRoles('admin'), productController.softDeleteProduct);

// Restore Product
router.put('/restore', verifyToken, authorizeRoles('admin'), productController.restoreProduct);

router.delete('/permanentDelete', verifyToken, authorizeRoles('admin'), productController.permanentDeleteProduct);

module.exports = router;