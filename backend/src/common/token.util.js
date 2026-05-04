const jwt = require('jsonwebtoken');
const crypto = require('crypto');
const RefreshToken = require('../modules/auth/refreshToken_model');

const ACCESS_TOKEN_EXPIRY = '15m';   // Short-lived access token
const REFRESH_TOKEN_EXPIRY = '30d';   // Long-lived refresh token
const REFRESH_TOKEN_EXPIRY_MS = 30 * 24 * 60 * 60 * 1000; // 30 days in ms

// TESTING
// const ACCESS_TOKEN_EXPIRY = '30s';
// const REFRESH_TOKEN_EXPIRY = '2m';
// const REFRESH_TOKEN_EXPIRY_MS = 2 * 60 * 1000;

// Generate short-lived JWT access token
exports.generateAccessToken = (user) => {
  return jwt.sign(
    { id: user._id, role: user.role },
    process.env.JWT_SECRET,
    { expiresIn: ACCESS_TOKEN_EXPIRY }
  );
};

// Generate a secure random refresh token, save to DB, return the raw token
exports.generateRefreshToken = async (userId) => {
  // Revoke any existing refresh tokens for this user (single session)
  await RefreshToken.updateMany({ user: userId }, { isRevoked: true });

  // Create a cryptographically secure random token
  const rawToken = crypto.randomBytes(64).toString('hex');

  await RefreshToken.create({
    token: rawToken,
    user: userId,
    expiresAt: new Date(Date.now() + REFRESH_TOKEN_EXPIRY_MS),
  });

  return rawToken;
};

// Validate refresh token from DB
exports.verifyRefreshToken = async (rawToken) => {
  const record = await RefreshToken.findOne({ token: rawToken }).populate('user');

  if (!record) throw new Error('Refresh token not found');
  if (record.isRevoked) throw new Error('Refresh token has been revoked');
  if (record.expiresAt < new Date()) {
    record.isRevoked = true;
    await record.save();
    throw new Error('Refresh token has expired');
  }

  return record;
};

// Revoke a specific refresh token (logout)
exports.revokeRefreshToken = async (rawToken) => {
  const record = await RefreshToken.findOne({ token: rawToken });
  if (record) {
    record.isRevoked = true;
    await record.save();
  }
};

// Revoke ALL refresh tokens for a user (logout from all devices)
exports.revokeAllRefreshTokens = async (userId) => {
  await RefreshToken.updateMany({ user: userId }, { isRevoked: true });
};