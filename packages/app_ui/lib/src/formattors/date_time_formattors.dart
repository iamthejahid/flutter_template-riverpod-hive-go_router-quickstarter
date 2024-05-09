import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex < 6 &&
          (nonZeroIndex == 2 || nonZeroIndex == 4) &&
          nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();

    if (newText.length > 8) {
      return oldValue;
    }

    final v = newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
    return v;
  }
}
