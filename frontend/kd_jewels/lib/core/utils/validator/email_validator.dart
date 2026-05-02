class EmailValidator {
  static final List<String> allowedDomains = [
    '@gmail.com',
    '@yahoo.com',
    '@outlook.com',
    '@hotmail.com',
  ];

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }

    // Basic email format check
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    // Check if the domain is in allowed list
    final domain = value.substring(value.indexOf('@'));
    if (!allowedDomains.contains(domain.toLowerCase())) {
      return 'Only Gmail, Yahoo, Outlook, or Hotmail addresses are allowed';
    }

    return null; // Email is valid
  }
}
