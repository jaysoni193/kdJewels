const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const authRoutes = require('./modules/auth/auth.routes');
const productRoutes = require('./modules/product/product.routes');
const categoryRoutes = require('./modules/category/category.routes');

const app = express();

// Middleware
app.use(express.json());
app.use(cors());
app.use(morgan('dev'));

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/products', productRoutes);
app.use('/api/categories', categoryRoutes);

module.exports = app;
