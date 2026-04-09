const Product = require('./product.model');
const mongoose = require('mongoose');

//CREATE
exports.createProduct = async (productData) => {
  return await Product.create(productData);
};

//Get all products eith  pagination
exports.getProducts = async (query) => {
  const page = parseInt(query.page) || 1;
  const limit = parseInt(query.limit) || 10;


  const skip = (page - 1) * limit;

  const products = await Product.find().skip(skip).limit(limit);

  const total = await Product.countDocuments();

  return {
    products,
    total,
    page: Number(page),
    pages: Math.ceil(total / limit),
  };
}

//Get single product by id
exports.getProductById = async (id) => {
  return await Product.findById(id);
};

//Update product by id
exports.updateProduct = async (id, updateData) => {
  return await Product.findByIdAndUpdate(id, updateData, { new: true });
};

//Search products by title or description
exports.searchProducts = async (body = {}) => {
  const page = parseInt(body.page) || 1;
  const limit = parseInt(body.limit) || 10;
  const search = body.search?.trim();

  const skip = (page - 1) * limit;

  let filter = {};

  if (search) {
    filter.$or = [
      { title: { $regex: search, $options: 'i' } },
      { description: { $regex: search, $options: 'i' } }
    ];
  }

  const products = await Product.find(filter)
    .skip(skip)
    .limit(limit)
    .sort({ createdAt: -1 });

  const total = await Product.countDocuments(filter);

  return {
    products,
    total,
    page,
    pages: Math.ceil(total / limit),
  };
};

//filter products by category, price range, and rating
exports.filterProducts = async (body = {}, user = {}) => {

  const page = parseInt(body.page) || 1;
  const limit = parseInt(body.limit) || 10;

  const minPrice = body.minPrice ? Number(body.minPrice) : undefined;
  const maxPrice = body.maxPrice ? Number(body.maxPrice) : undefined;

  const isVisible =
    body.isVisible !== undefined
      ? body.isVisible === true || body.isVisible === 'true'
      : undefined;

  const skip = (page - 1) * limit;

  let filter = {};

  // 💰 PRICE FILTER
  if (minPrice !== undefined || maxPrice !== undefined) {
    filter.price = {};
    if (minPrice !== undefined) filter.price.$gte = minPrice;
    if (maxPrice !== undefined) filter.price.$lte = maxPrice;
  }

  // 🟢 VISIBILITY
  if (isVisible !== undefined) {
    filter.isVisible = isVisible;
  }


  // 🔐 USER CONTROL
  if (!user || user.role !== 'admin') {
    filter.isVisible = true;
    filter.isDeleted = false;
  }

  // 🧩 MULTI CATEGORY FILTER
  if (body.categoryIds && Array.isArray(body.categoryIds)) {
    filter.categories = {
      $in: body.categoryIds
    };
  }


  // 🔽 SORT
  let sort = { createdAt: -1 };

  if (body.sortBy) {
    sort[body.sortBy] = body.order === 'asc' ? 1 : -1;
  }
  console.log("CATEGORY ID =>", body.categoryId);
  console.log("FILTER =>", filter);

  const products = await Product.find(filter)
    .populate('categories', 'name')
    .sort(sort)
    .skip(skip)
    .limit(limit);

  const total = await Product.countDocuments(filter);

  return {
    products,
    total,
    page,
    pages: Math.ceil(total / limit),
  };
};

