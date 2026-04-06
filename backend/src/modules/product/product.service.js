const Product = require('./product.model');

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