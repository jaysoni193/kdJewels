const Banner = require('./banner.model');

// CREATE
exports.createBanner = async (req, res) => {
  try {
    const data = await bannerService.createBanner(
      req.body,
      req.file
    );

    res.json({ success: true, data });

  } catch (err) {
    res.status(400).json({
      success: false,
      message: err.message,
    });
  }
};
// UPDATE
exports.updateBanner = async (req, res) => {
  const data = await bannerService.updateBanner(
    req.params.id,
    req.body,
    req.file
  );

  res.json({ success: true, data });
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

//Get By Type
exports.getBannersByType = async (req, res) => {
  try {
    const { type } = req.params;

    const data = await bannerService.getBannersByType(type);

    res.json({
      success: true,
      data,
    });

  } catch (err) {
    res.status(400).json({
      success: false,
      message: err.message,
    });
  }
};