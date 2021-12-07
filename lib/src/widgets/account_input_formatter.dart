import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:flutter/services.dart';

/// @class TextInputFormatter for validate account
class AccountInputFormatter extends TextInputFormatter {
  /// @var [bankCode]: should receive three digit Brazilian bank code
  final int bankCode;

  /// @var accountType: checking or saving
  final AccountType accountType;

  /// @construct [AccountInputFormatter]
  AccountInputFormatter({required this.bankCode, required this.accountType});

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
    if (_bankAccountLength != 0) {
      if (bankCode == 001) {
        if (newValue.text.contains(RegExp('[A-W, Y-Z, a-w, y-z]'))) {
          return oldValue;
        }
      } else if (bankCode == 237) {
        if (newValue.text.contains(RegExp('[A-O, Q-Z, a-o, q-z]'))) {
          return oldValue;
        }
      }
      if (newValue.text.length > 1) {
        // ignore: parameter_assignments
        newValue = newValue.copyWith(
          text: newValue.text.replaceFirst(
            RegExp('[0-9, A-Z, a-z]'),
            "",
            bankCode == 104 ? 5 : 0,
          ),
        );
      }
      final List<String> accountTextList = newValue.text
          .replaceAll(" ", "")
          .replaceAll("-", "")
          .replaceAll(".", "")
          .split('')
          .reversed
          .toList();
      if (bankCode == 104 && accountTextList.length > 9) {
        accountTextList.removeRange(
          accountTextList.length - 3,
          accountTextList.length,
        );
      }

      for (var i = accountTextList.length; i < _bankAccountLength; i++) {
        accountTextList.add('0');
      }

      if (bankCode == 237) {
        accountTextList.insert(4, ".");
      } else if (bankCode == 104) {
        if (accountType == AccountType.checking) {
          accountTextList.addAll([" ", " ", "1", "0", "0"]);
        } else {
          accountTextList.addAll([" ", " ", "3", "1", "0"]);
        }
      }
      accountTextList.insert(1, "-");
      return newValue.copyWith(
        text: accountTextList.reversed.join(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: accountTextList.length),
        ),
      );
    } else {
      if (newValue.text.contains(RegExp('[A-Z, a-z]'))) {
        return oldValue;
      }
      final accountTextList =
          newValue.text.replaceAll("-", "").split('').reversed.toList();
      if (accountTextList.length > 1) {
        accountTextList.insert(1, "-");
      }
      return newValue.copyWith(
        text: accountTextList.reversed.join(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: accountTextList.length),
        ),
      );
    }
  }

  int get _bankAccountLength {
    switch (bankCode) {
      case 001:
        return 9;
      case 237:
        return 8;
      case 104:
        return 9;
      case 341:
        return 6;
      default:
        return 0;
    }
  }
}
