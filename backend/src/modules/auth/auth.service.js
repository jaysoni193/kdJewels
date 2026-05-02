const User = require('./auth.model');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const SALT_ROUNDS = parseInt(process.env.BCRYPT_ROUNDS) || 12;
// REGISTER
exports.registerUser = async (data) => {
  const { name, email, password,  } = data;

  // check existing user
  const existingUser = await User.findOne({ email });
  if (existingUser) {
    throw new Error('User already exists');
  }

  // hash password
  const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);

  // create user
  const user = await User.create({
    name,
    email,
    password: hashedPassword,
    role: 'user',
  });

  // FIX (Critical #1): Strip password hash before returning — never expose it to client
  const { password: _, ...safeUser } = user.toObject();
  return safeUser;
};

// LOGIN
exports.loginUser = async (data) => {
  const { email, password } = data;

  const user = await User.findOne({ email });
  if (!user) {
    throw new Error('Invalid email or password');
  }

  // compare password
  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) {
    throw new Error('Invalid email or password');
  }

  // generate token
  const token = jwt.sign(
    { id: user._id, role: user.role },
    process.env.JWT_SECRET,
    { expiresIn: '7d' }
  );
  // FIX (Critical #1): Strip password from user object before returning
  const { password: _, ...safeUser } = user.toObject();
  return { user: safeUser, token };
};