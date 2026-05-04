const service = require('./category.service');

// CREATE
exports.createCategory = async (req, res) => {
  try {
    const data = await service.createCategory(req.body);
    res.status(201).json({ success: true, message: 'Category created successfully', data });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// GET ALL (flat)
exports.getCategories = async (req, res) => {
  try {
    const data = await service.getCategories();
    res.status(200).json({ success: true, message: 'Categories retrieved successfully', data });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};

// GET BY SECTION — called when user taps Men / Women / Kids
exports.getCategoriesBySection = async (req, res) => {
  try {
    const { section } = req.params;
    const data = await service.getCategoriesBySection(section.toLowerCase());
    res.status(200).json({
      success: true,
      message: `${section} categories retrieved successfully`,
      section: section.toLowerCase(),
      data,
    });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// GET FULL TREE (all sections grouped)
exports.getCategoryTree = async (req, res) => {
  try {
    const data = await service.getCategoryTree();
    res.status(200).json({ success: true, data });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
};

// UPDATE
exports.updateCategory = async (req, res) => {
  try {
    const data = await service.updateCategory(req.params.id, req.body);
    res.status(200).json({ success: true, message: 'Category updated successfully', data });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// DELETE
exports.deleteCategory = async (req, res) => {
  try {
    const data = await service.deleteCategory(req.params.id);
    res.status(200).json({ success: true, message: 'Category deleted successfully', data });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};