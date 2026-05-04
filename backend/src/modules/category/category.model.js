const mongoose = require('mongoose');

const categorySchema = new mongoose.Schema({

  name: {
    type: String,
    required: true,
  },

  // 🏷️ Gender section — which homepage tab this belongs to
  section: {
    type: String,
    enum: ['men', 'women', 'kids'],
    required: true,
  },

  // 🌳 Parent Category (null = root)
  parent: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Category',
    default: null,
  },

  isActive: {
    type: Boolean,
    default: true,
  },

  isDeleted: {
    type: Boolean,
    default: false,
  },

}, { timestamps: true });

// Index for fast section-based queries
categorySchema.index({ section: 1, isDeleted: 1, isActive: 1 });

module.exports = mongoose.model('Category', categorySchema);