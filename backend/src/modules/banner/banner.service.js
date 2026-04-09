const Banner = require('./banner.model');
const cloudinary = require('../../common/utils/cloudinary');
const streamifier = require('streamifier');

// CREATE
exports.createBanner = async (data) => {

  let prefetchData = null;

  // 🔥 AUTO FETCH DATA
  if (data.redirectType === 'product') {
    prefetchData = await Product.findById(data.redirectId)
      .populate('category');
  }

  if (data.redirectType === 'category') {
    prefetchData = {
      category: await Category.findById(data.redirectId),
      products: await Product.find({ category: data.redirectId }).limit(10)
    };
  }

  return await Banner.create({
    ...data,
    prefetchData
  });
};
// UPDATE
exports.updateBanner = async (id, body, file) => {

  const banner = await Banner.findById(id);

  let imageData = banner.image;

  if (file) {
    // delete old image
    if (banner.image?.public_id) {
      await cloudinary.uploader.destroy(banner.image.public_id);
    }

    const result = await new Promise((resolve, reject) => {
      const stream = cloudinary.uploader.upload_stream(
        { folder: 'banners' },
        (error, result) => {
          if (error) reject(error);
          else resolve(result);
        }
      );

      require('streamifier')
        .createReadStream(file.buffer)
        .pipe(stream);
    });

    imageData = {
      url: result.secure_url,
      public_id: result.public_id,
    };
  }

  return await Banner.findByIdAndUpdate(
    id,
    { ...body, image: imageData },
    { new: true }
  );
};

// DELETE
exports.deleteBanner = async (id) => {
  return await Banner.findByIdAndDelete(id);
};

// GET ALL (ADMIN)
exports.getAllBanners = async () => {
  return await Banner.find().sort({ priority: -1 });
};

// GET ACTIVE (APP)
exports.getActiveBanners = async () => {
  return await Banner.find({ isActive: true })
    .sort({ priority: -1 });
};

// GET BY TYPE
exports.getBannersByType = async (type) => {
  const now = new Date();

  return await Banner.find({
    type,
    isActive: true,
    $or: [
      { startDate: { $exists: false } },
      { startDate: { $lte: now } }
    ],
    $or: [
      { endDate: { $exists: false } },
      { endDate: { $gte: now } }
    ]
  }).sort({ priority: -1 });
};