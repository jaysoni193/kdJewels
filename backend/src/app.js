const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const authRoutes = require('./modules/auth/auth.routes');
const productRoutes = require('./modules/product/product.routes');

const app = express();

// Middleware
app.use(express.json());
app.use(cors());
app.use(morgan('dev'));

console.log("🔥 Server restarted 🔥");

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/products', productRoutes);

module.exports = app;
