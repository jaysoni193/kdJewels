const mongoose = require('mongoose');
const Category = require('./category.model');
const Product = require('../product/product.model');

const isValidId = (id) => mongoose.Types.ObjectId.isValid(id);
const VALID_SECTIONS = ['men', 'women', 'kids'];

// ─── CREATE ───────────────────────────────────────────────────────────────────
exports.createCategory = async (body) => {
  const { name, parent, section } = body;

  if (!name || !name.trim()) throw new Error('Category name is required');

  if (!section) throw new Error('Section is required (men, women, kids)');
  if (!VALID_SECTIONS.includes(section)) throw new Error('Section must be one of: men, women, kids');

  if (parent && !isValidId(parent)) throw new Error('Invalid parent category ID');

  if (parent) {
    const parentDoc = await Category.findOne({ _id: parent, isDeleted: false });
    if (!parentDoc) throw new Error('Parent category not found');
    // Child must belong to same section as parent
    if (parentDoc.section !== section) {
      throw new Error(`Parent belongs to "${parentDoc.section}" — child section must match`);
    }
  }

  return await Category.create({
    name: name.trim(),
    section,
    parent: parent || null,
  });
};

// ─── GET ALL FLAT ─────────────────────────────────────────────────────────────
exports.getCategories = async () => {
  return await Category.find({ isDeleted: false, isActive: true })
    .populate('parent', 'name section')
    .sort({ section: 1, createdAt: -1 });
};

// ─── GET BY SECTION (Men / Women / Kids tab) ──────────────────────────────────
exports.getCategoriesBySection = async (section) => {
  if (!VALID_SECTIONS.includes(section)) {
    throw new Error('Section must be one of: men, women, kids');
  }

  const categories = await Category.find({
    section,
    isDeleted: false,
    isActive: true,
  })
    .select('name section parent isActive createdAt')
    .lean();

  const map = {};
  const tree = [];

  categories.forEach(cat => { map[cat._id] = { ...cat, children: [] }; });
  categories.forEach(cat => {
    if (cat.parent) {
      map[cat.parent] ? map[cat.parent].children.push(map[cat._id]) : tree.push(map[cat._id]);
    } else {
      tree.push(map[cat._id]);
    }
  });

  return tree;
};

// ─── GET FULL TREE (grouped by section) ───────────────────────────────────────
exports.getCategoryTree = async () => {
  const categories = await Category.find({ isDeleted: false, isActive: true })
    .select('name section parent isActive createdAt')
    .lean();

  const result = { men: [], women: [], kids: [] };
  const map = {};

  categories.forEach(cat => { map[cat._id] = { ...cat, children: [] }; });
  categories.forEach(cat => {
    if (cat.parent) {
      map[cat.parent] ? map[cat.parent].children.push(map[cat._id]) : result[cat.section].push(map[cat._id]);
    } else {
      result[cat.section].push(map[cat._id]);
    }
  });

  return result;
};

// ─── UPDATE ───────────────────────────────────────────────────────────────────
exports.updateCategory = async (id, body) => {
  if (!isValidId(id)) throw new Error('Invalid category ID');

  const { name, parent, isActive, section } = body;
  const updateData = {};

  if (name !== undefined) {
    if (!name.trim()) throw new Error('Name cannot be empty');
    updateData.name = name.trim();
  }
  if (section !== undefined) {
    if (!VALID_SECTIONS.includes(section)) throw new Error('Section must be one of: men, women, kids');
    updateData.section = section;
  }
  if (parent !== undefined) {
    if (parent !== null && !isValidId(parent)) throw new Error('Invalid parent category ID');
    if (parent && parent.toString() === id.toString()) throw new Error('Category cannot be its own parent');
    if (parent) {
      const parentDoc = await Category.findOne({ _id: parent, isDeleted: false });
      if (!parentDoc) throw new Error('Parent category not found');
    }
    updateData.parent = parent;
  }
  if (isActive !== undefined) updateData.isActive = Boolean(isActive);

  if (Object.keys(updateData).length === 0) throw new Error('No valid fields to update');

  const updated = await Category.findOneAndUpdate(
    { _id: id, isDeleted: false },
    updateData,
    { new: true, runValidators: true }
  ).populate('parent', 'name section');

  if (!updated) throw new Error('Category not found');
  return updated;
};

// ─── DELETE (soft) ────────────────────────────────────────────────────────────
exports.deleteCategory = async (id) => {
  if (!id || !isValidId(id)) throw new Error('Valid category ID is required');

  const category = await Category.findOne({ _id: id, isDeleted: false });
  if (!category) throw new Error('Category not found');

  const productExists = await Product.findOne({ category: id });
  if (productExists) throw new Error('Cannot delete — products are linked to this category');

  const childExists = await Category.findOne({ parent: id, isDeleted: false });
  if (childExists) throw new Error('Cannot delete — category has child categories');

  category.isDeleted = true;
  category.isActive = false;
  await category.save();
  return category;
};

// ─── GET ALL CHILD IDs (for product filtering) ────────────────────────────────
exports.getAllChildCategoryIds = (categories, parentId) => {

  let result = [parentId];

  categories.forEach(cat => {
    if (cat.parent && cat.parent.toString() === parentId.toString()) {
      result = result.concat(exports.getAllChildCategoryIds(categories, cat._id));
    }
  });

  return result;
};