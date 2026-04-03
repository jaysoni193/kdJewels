const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const authRoutes = require('./modules/auth/auth.routes');

const app = express();

// Middleware
app.use(express.json());
app.use(cors());
app.use(morgan('dev'));
console.log("🔥 Server restarted 🔥");
// Routes
app.use('/api/auth', authRoutes);

module.exports = app;
