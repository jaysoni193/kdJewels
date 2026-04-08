const service = require('./category.service');

exports.createCategory = async (req, res) => {
  const data = await service.createCategory(req.body);

  res.json({
    success: true,
    message: 'Category created successfully',
    data,
  });
};

exports.getCategories = async (req, res) => {
  const data = await service.getCategories();

  res.json({
    success: true,
    message: 'Categories retrieved successfully',
    data,
  });
};

exports.updateCategory = async (req, res) => {
  try {
    const data = await service.updateCategory(req.params.id, req.body);

    res.status(200).json({
      success: true,
      data,
    });

  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

exports.deleteCategory = async (req, res) => {
  try {
    const data = await service.deleteCategory(req.params.id);

    res.status(200).json({
      success: true,
      message: 'Category deleted successfully',
      data,
    });

  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};