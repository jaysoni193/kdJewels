const express = require('express');
const router = express.Router();
const { body, param, validationResult } = require('express-validator');

const controller = require('./category.controller');
const { verifyToken } = require('../../common/middleware/auth.middleware');

// ─── Validation handler ───────────────────────────────────────────────────────
function validate(req, res, next) {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(422).json({
      success: false,
      message: 'Validation failed',
      errors: errors.array().map(e => ({ field: e.path, message: e.msg })),
    });
  }
  next();
}

// ─── Rules ────────────────────────────────────────────────────────────────────
const createRules = [
  body('name').trim().notEmpty().withMessage('Name is required').isLength({ max: 100 }),
  body('section')
    .notEmpty().withMessage('Section is required')
    .isIn(['men', 'women', 'kids']).withMessage('Section must be men, women, or kids'),
  body('parent').optional({ nullable: true }).isMongoId().withMessage('Invalid parent ID'),
];

const updateRules = [
  param('id').isMongoId().withMessage('Invalid category ID'),
  body('name').optional().trim().notEmpty().withMessage('Name cannot be empty').isLength({ max: 100 }),
  body('section').optional().isIn(['men', 'women', 'kids']).withMessage('Section must be men, women, or kids'),
  body('parent').optional({ nullable: true }).isMongoId().withMessage('Invalid parent ID'),
  body('isActive').optional().isBoolean().withMessage('isActive must be true or false'),
  body('isDeleted').not().exists().withMessage('isDeleted cannot be set directly'),
];

const idRules = [
  param('id').isMongoId().withMessage('Invalid category ID'),
];

const sectionRules = [
  param('section')
    .isIn(['men', 'women', 'kids']).withMessage('Section must be men, women, or kids'),
];

// ─── Routes ───────────────────────────────────────────────────────────────────

// Public — browsing
router.get('/getCategories', controller.getCategories);

router.get('/tree', controller.getCategoryTree);
router.get('/section/:section', sectionRules, validate, controller.getCategoriesBySection);

// Protected — admin only
router.post('/createCategory', verifyToken, createRules, validate, controller.createCategory);
router.put('/updateCategory/:id', verifyToken, updateRules, validate, controller.updateCategory);
router.delete('/deleteCategory/:id', verifyToken, idRules, validate, controller.deleteCategory);

module.exports = router;