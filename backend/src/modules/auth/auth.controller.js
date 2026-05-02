const authService = require('./auth.service');

// REGISTER
exports.register = async (req, res) => {
  try {
    const user = await authService.registerUser(req.body);
    res.status(201).json({ success: true, message: 'User registered successfully', data: user });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// LOGIN
exports.login = async (req, res) => {
  try {
    const result = await authService.loginUser(req.body);
    res.status(200).json({
      success: true,
      message: 'Login successfully.',
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
      user: result.user,
    });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// REFRESH TOKEN — issue new access + refresh token pair
exports.refresh = async (req, res) => {
  try {
    const { refreshToken } = req.body;
    const tokens = await authService.refreshTokens(refreshToken);
    res.status(200).json({
      success: true,
      message: 'Tokens refreshed successfully',
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    });
  } catch (error) {
    res.status(401).json({ success: false, message: error.message });
  }
};

// LOGOUT — revoke this device's refresh token
exports.logout = async (req, res) => {
  try {
    const { refreshToken } = req.body;
    await authService.logoutUser(refreshToken);
    res.status(200).json({ success: true, message: 'Logged out successfully' });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

// LOGOUT ALL DEVICES — revoke all refresh tokens for the authenticated user
exports.logoutAll = async (req, res) => {
  try {
    await authService.logoutAllDevices(req.user.id); // req.user set by verifyToken middleware
    res.status(200).json({ success: true, message: 'Logged out from all devices' });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};