import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordLimitFormatter extends TextInputFormatter {
  final int wordLimit;

  WordLimitFormatter(this.wordLimit);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final words = newValue.text.trim().split(RegExp(r'\s+'));
    if (words.length > wordLimit) {
      // If the word limit is exceeded, revert to the old value
      return oldValue;
    }
    return newValue;
  }
}