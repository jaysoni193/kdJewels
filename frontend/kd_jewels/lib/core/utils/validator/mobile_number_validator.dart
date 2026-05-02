import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileNumberValidator extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the current text
    String newText = newValue.text;

    // Enforce the starting digit rule (only 6, 7, 8, 9 are allowed)
    if (newText.isNotEmpty) {
      if (newText.length == 1) {
        // The first digit should be 6, 7, 8, or 9
        if (!RegExp(r'^[6-9]$').hasMatch(newText[0])) {
          return oldValue; // Reject if it's not 6, 7, 8, or 9
        }
      }

      // Limit the number to 10 digits
      if (newText.length > 10) {
        return oldValue; // Reject if the length exceeds 10 digits
      }

      // Allow only numeric characters for the entire mobile number
      if (!RegExp(r'^[0-9]*$').hasMatch(newText)) {
        return oldValue; // Reject if it's not a digit
      }
    }

    return newValue;
  }
}
