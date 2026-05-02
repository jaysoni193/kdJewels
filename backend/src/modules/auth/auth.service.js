const User = require('./auth.model');
const bcrypt = require('bcryptjs');
const tokenUtil = require('../../common/token.util');

const SALT_ROUNDS = parseInt(process.env.BCRYPT_ROUNDS) || 12;

// REGISTER
exports.registerUser = async (data) => {
  const { name, email, password } = data;

  const existingUser = await User.findOne({ email });
  if (existingUser) {
    throw new Error('Registration failed. Try a different email.');
  }

  const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);

  const user = await User.create({
    name,
    email,
    password: hashedPassword,
    role: 'user',
  });

  // Strip password before returning
  const { password: _, ...safeUser } = user.toObject();
  return safeUser;
};

// LOGIN — now returns accessToken + refreshToken
exports.loginUser = async (data) => {
  const { email, password } = data;

  const user = await User.findOne({ email });
  if (!user) throw new Error('Invalid email or password');

  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) throw new Error('Invalid email or password');

  // Generate both tokens
  const accessToken = tokenUtil.generateAccessToken(user);
  const refreshToken = await tokenUtil.generateRefreshToken(user._id);

  const { password: _, ...safeUser } = user.toObject();
  return { user: safeUser, accessToken, refreshToken };
};

// REFRESH — validate refresh token, issue new access token + rotate refresh token
exports.refreshTokens = async (rawRefreshToken) => {
  if (!rawRefreshToken) throw new Error('Refresh token is required');

  const record = await tokenUtil.verifyRefreshToken(rawRefreshToken);
  const user = record.user;

  // Rotate: revoke old, issue new refresh token
  await tokenUtil.revokeRefreshToken(rawRefreshToken);

  const newAccessToken = tokenUtil.generateAccessToken(user);
  const newRefreshToken = await tokenUtil.generateRefreshToken(user._id);

  return { accessToken: newAccessToken, refreshToken: newRefreshToken };
};

// LOGOUT — revoke refresh token for this device
exports.logoutUser = async (rawRefreshToken) => {
  if (!rawRefreshToken) throw new Error('Refresh token is required');
  await tokenUtil.revokeRefreshToken(rawRefreshToken);
};

// LOGOUT ALL DEVICES — revoke all refresh tokens for user
exports.logoutAllDevices = async (userId) => {
  await tokenUtil.revokeAllRefreshTokens(userId);
};