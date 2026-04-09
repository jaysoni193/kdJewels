const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({

  title: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  description: {
    type: String,
  },
  // 🔗 RELATION
  categories: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Category',
  },

  images: [
    {
      url: String,
      public_id: String,
    }
  ],

  isVisible: {
    type: Boolean,
    default: true,
  },

  // ✅ SOFT DELETE FIELD
  isDeleted: {
    type: Boolean,
    default: false,
  },

  deletedAt: {
    type: Date,
    default: null,
  },

},
  { timestamps: true, }
);

const Product = mongoose.model('Product', productSchema);
module.exports = Product;