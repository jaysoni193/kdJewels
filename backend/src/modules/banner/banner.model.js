const mongoose = require('mongoose');

const bannerSchema = new mongoose.Schema({

  title: String,

  image: {
    url: String,
    public_id: String,
  },

  // 🔥 TYPE CONTROL
  type: {
    type: String,
    enum: ['slider', 'grid', 'popup'],
    required: true,
  },

  // 🔥 WHERE TO SHOW
  position: {
    type: String,
    enum: ['home', 'category', 'product'],
    default: 'home',
  },

  // 🔗 REDIRECTION
  redirectType: {
    type: String,
    enum: ['product', 'category', 'url'],
  },

  redirectId: {
    type: mongoose.Schema.Types.ObjectId,
    default: null,
  },

  redirectUrl: String,

  // 🔥 VISIBILITY
  isActive: {
    type: Boolean,
    default: true,
  },

  // 🔥 ORDER
  priority: {
    type: Number,
    default: 0,
  },

  // ⏰ SCHEDULE (OPTIONAL)
  startDate: Date,
  endDate: Date,

}, { timestamps: true });

module.exports = mongoose.model('Banner', bannerSchema);