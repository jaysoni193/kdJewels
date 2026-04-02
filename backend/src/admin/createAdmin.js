require('dotenv').config();
const bcrypt = require('bcryptjs');
const mongoose = require('mongoose');
const User = require('./auth.model');

mongoose.connect(process.env.MONGO_URI);
const createAdmin = async () => {
  try {
    const hasPassword = await bcrypt.hash('admin123', 10);
    await User.create({
      name: 'Admin',
      email: 'admin@gmail.com',
      password: hasPassword,
      role: 'admin',
    }),
      console.log("✅✅ Admin created ✅✅");
    process.exit(); l̥
  } catch (error) {
    console.error('Error creating admin:', error);
  };
  createAdmin();
}