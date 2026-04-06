const cloudinary = require('../../common/config/cloudinary');

// Upload multiple
exports.uploadMultipleImages = async (files) => {
  const uploadPromises = files.map((file) => {
    return new Promise((resolve, reject) => {
      const stream = cloudinary.uploader.upload_stream(
        { folder: 'products' },
        (error, result) => {
          if (error) return reject(error);
          resolve({
            url: result.secure_url,
            public_id: result.public_id,
          });
        }
      );
      stream.end(file.buffer);
    });
  });

  return Promise.all(uploadPromises);
};

// delete multiple images
exports.deleteMultipleImages = async (publicIds) => {
  return await cloudinary.api.delete_resources(publicIds);
};