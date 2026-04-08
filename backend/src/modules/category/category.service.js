const Category = require('./category.model');
const Product = require('../product/product.model');

exports.createCategory = async (body) => {
  return await Category.create(body);
};

exports.getCategories = async () => {
  return await Category.find({ isActive: true });
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
