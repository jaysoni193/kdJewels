const mongoose = require('mongoose');

const categorySchema = new mongoose.Schema({

  name: {
    type: String,
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
  }

}, { timestamps: true });

module.exports = mongoose.model('Category', categorySchema);