import 'package:flutter/services.dart';

/// @class TextInputFormatter for validate account
class BranchInputFormatter extends TextInputFormatter {
  /// @var [bankCode]: should receive three digit Brazilian bank code
  final int bankCode;

  /// @construct [BranchInputFormatter]
  BranchInputFormatter({required this.bankCode});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // ignore: parameter_assignments
    newValue = newValue.copyWith(
      text: newValue.text.replaceAll(
        RegExp(r'[!@#$%&*\(\)\-\_\\\=\+\[\]\{\}\/\?\:\;\>\<\,\.\°\º\ª]'),
        "",
      ),
    );

    if (bankCode == 001 || bankCode == 237) {
      if (bankCode == 001) {
        if (newValue.text.contains(RegExp('[A-W, Y-Z, a-w, y-z]'))) {
          return oldValue;
        }
      } else {
        if (newValue.text.contains(RegExp('[A-O, Q-Z, a-o, q-z]'))) {
          return oldValue;
        }
      }

      if (newValue.text.length > 1) {
        // ignore: parameter_assignments
        newValue = newValue.copyWith(
          text: newValue.text.replaceFirst(RegExp('[0-9, A-Z, a-z]'), ""),
        );
      }
      final List<String> accountTextList = newValue.text
          .replaceAll(" ", "")
          .replaceAll("-", "")
          .replaceAll(".", "")
          .split('')
          .reversed
          .toList();

      for (var i = accountTextList.length; i < _bankBranchLength; i++) {
        accountTextList.add('0');
      }

      accountTextList.insert(1, "-");
      return newValue.copyWith(
        text: accountTextList.reversed.join(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: accountTextList.length),
        ),
      );
    } else {
      if (_bankBranchLength != 0) {
        final List<String> accountTextList = newValue.text
            .replaceAll(" ", "")
            .replaceAll("-", "")
            .replaceAll(".", "")
            .split('')
            .reversed
            .toList();

        if (newValue.text.length > 1) {
          accountTextList.removeLast();
        }

        for (var i = accountTextList.length; i < _bankBranchLength; i++) {
          accountTextList.add('0');
        }

        if (newValue.text.contains(RegExp('[A-Z, a-z]'))) {
          return oldValue;
        }

        return newValue.copyWith(
          text: accountTextList.reversed.join(),
          selection: TextSelection.fromPosition(
            TextPosition(offset: accountTextList.length),
          ),
        );
      }
      return newValue;
    }
  }

  int get _bankBranchLength {
    if (bankCode == 237 || bankCode == 001) {
      return 5;
    }
    if (bankCode == 104 || bankCode == 341) {
      return 4;
    }
    return 0;
  }
}
