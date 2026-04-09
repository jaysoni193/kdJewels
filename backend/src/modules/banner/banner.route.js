const express = require('express');
const router = express.Router();

const controller = require('./banner.controller');

// ADMIN
router.post('/createBanner', controller.createBanner);
router.put('/updateBanner/:id', controller.updateBanner);
router.delete('/deleteBanner/:id', controller.deleteBanner);
router.get('/getAllBanners', controller.getAllBanners);

// 🔥 APP USE
router.get('/getActiveBanners', controller.getActiveBanners);

// CREATE WITH IMAGE
router.post('/', upload.single('image'), controller.createBanner);

// UPDATE WITH IMAGE
router.put('/:id', upload.single('image'), controller.updateBanner);

router.get('/getBannersByType/:type', controller.getBannersByType);

module.exports = router;