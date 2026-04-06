const productService = require('./product.service');

//CREATE
exports.createProduct = async (req, res) => {
  try {
    let imageUrls = [];

    // ✅ Case 1: Images from file upload
    if (req.files && req.files.length > 0) {
      imageUrls = await uploadService.uploadMultipleImages(req.files);
    }

    // ✅ Case 2: Images from JSON (manual URLs)
    else if (req.body.images) {
      // If string (single)
      if (typeof req.body.images === 'string') {
        imageUrls = [req.body.images];
      }
      // If array
      else {
        imageUrls = req.body.images;
      }
    }

    const productData = {
      ...req.body,
      images: imageUrls,
    };

    const product = await productService.createProduct(productData);

    res.json({
      success: true,
      data: product,
    });

  } catch (error) {
    console.error(error);
    res.status(401).json({
      success: false,
      message: error.message,
    });
  }
};

//Get all
exports.getAllProducts = async (req, res) => {
  try {
    const result = await productService.getProducts(req, req.user);
    res.status(200).json({
      success: true,
      ...result,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
}

//Get single product by id
exports.getProductById = async (req, res) => {
  try {
    const product = await productService.getProductById(req.params.id);
    if (!product) {
      return res.status(404).json({
        success: false,
        message: 'Product not found',
      });
    }
    res.json({
      success: true,
      data: product,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
}

//Update product by id
exports.updateProduct = async (req, res) => {
  try {
    const { id, existingImages, removedImages } = req.body;

    let finalImages = [];

    // ✅ 1. Keep existing images
    if (existingImages) {
      let images = existingImages;

      if (typeof images === 'string') {
        images = JSON.parse(images);
      }

      finalImages = images;
    }

    // ✅ 2. Upload new images
    if (req.files && req.files.length > 0) {
      const newImages = await uploadService.uploadMultipleImages(req.files);
      finalImages = [...finalImages, ...newImages];
    }

    // ❌ 3. Delete removed images from Cloudinary
    if (removedImages) {
      let images = removedImages;

      if (typeof images === 'string') {
        images = JSON.parse(images);
      }

      for (let img of images) {
        if (img.public_id) {
          await uploadService.deleteImage(img.public_id);
        }
      }
    }

    // ✅ 4. Update product
    const updatedProduct = await productService.updateProduct(id, {
      ...req.body,
      images: finalImages,
    });

    res.json({
      success: true,
      data: updatedProduct,
    });

  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

//Soft Delete
exports.softDeleteProduct = async (req, res) => {
  try {
    const { id } = req.body;

    const product = await productService.updateProduct(id, {
      isDeleted: true,
      deletedAt: new Date(),
    });

    res.json({
      success: true,
      message: "Product moved to trash",
      data: product,
    });

  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

// Restore Product
exports.restoreProduct = async (req, res) => {
  try {
    const { id } = req.body;

    const product = await productService.updateProduct(id, {
      isDeleted: false,
      deletedAt: null,
    });

    res.json({
      success: true,
      message: "Product restored successfully",
      data: product,
    });

  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

// Permanent Delete
exports.permanentDeleteProduct = async (req, res) => {
  try {
    const { id } = req.body;

    const product = await productService.getProductById(id);

    if (!product || !product.isDeleted) {
      return res.status(400).json({
        success: false,
        message: "Product must be in trash first",
      });
    }

    // delete images from cloud
    const publicIds = product.images.map(i => i.public_id);

    if (publicIds.length) {
      await uploadService.deleteMultipleImages(publicIds);
    }

    await productService.deleteProduct(id);

    res.json({
      success: true,
      message: "Product permanently deleted",
    });

  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Search Products
exports.searchProducts = async (req, res) => {
  try {
    const result = await productService.searchProducts(req.body);

    res.status(200).json({
      success: true,
      ...result,
    });

  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};


// Filter Products
exports.filterProducts = async (req, res) => {
  try {
    const result = await productService.filterProducts(req.body, req.user);

    res.status(200).json({
      success: true,
      ...result,
    });

  } catch (error) {
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

