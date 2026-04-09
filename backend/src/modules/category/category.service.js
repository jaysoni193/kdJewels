const Category = require('./category.model');
const Product = require('../product/product.model');

exports.createCategory = async (body) => {
  return await Category.create(body);
};

exports.getCategories = async () => {
  return await Category.find({ isDeleted: false, isActive: true })
    .populate('parent', 'name');
};

exports.updateCategory = async (id, body) => {

  const updated = await Category.findByIdAndUpdate(
    id,
    body,
    { new: true }
  );

  if (!updated) {
    throw new Error('Category not found');
  }

  return updated;
};

exports.deleteCategory = async (id) => {

  if (!id) {
    throw new Error('Category ID is required');
  }

  // 🔍 Check if category exists
  const category = await Category.findById(id);

  if (!category) {
    throw new Error('Category not found');
  }

  // ⚠️ Check if any product is using this category
  const productExists = await Product.findOne({ category: id });

  if (productExists) {
    throw new Error('Cannot delete category, products are using it');
  }

  // 🗑️ Soft delete
  category.isDeleted = true;
  category.isActive = false;

  await category.save();

  return category;
};

exports.getCategoryTree = async () => {

  const categories = await Category.find({
    isDeleted: false,
    isActive: true,
  }).lean();

  const map = {};
  const tree = [];

  // Create map
  categories.forEach(cat => {
    map[cat._id] = { ...cat, children: [] };
  });

  // Build tree
  categories.forEach(cat => {
    if (cat.parent) {
      map[cat.parent]?.children.push(map[cat._id]);
    } else {
      tree.push(map[cat._id]);
    }
  });

  return tree;
};

// 🔥 GET ALL CHILD CATEGORY IDS (IMPORTANT FOR FILTER)
exports.getAllChildCategoryIds = (categories, parentId) => {

  let result = [parentId];

  categories.forEach(cat => {
    if (cat.parent && cat.parent.toString() === parentId.toString()) {
      result = result.concat(
        exports.getAllChildCategoryIds(categories, cat._id)
      );
    }
  });

  return result;
};