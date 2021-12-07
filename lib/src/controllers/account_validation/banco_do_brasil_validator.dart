import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const _accountLen = 8;

/// Banco do Brasil - 001
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation bancoDoBrasilValidator(
  BankAccountModel bankAccountModel,
) {
  final _bankAccountValidation = BankAccountValidation();

  final _account = bankAccountModel.accountNumberWithDigit
      .replaceAll("-", "")
      .splitByLength(1);
  final _accountNumber = _account[0].padLeft(_accountLen, '0');
  final _numbers = _accountNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sequence = 9 - i;
    sumSequence += int.parse(_numbers[i]) * sequence;
  }

  final digit = _module(sumSequence);

  _bankAccountValidation.isValid = digit == _account[1];
  _bankAccountValidation.digit = digit;
  _bankAccountValidation.account = _accountNumber;

  return _bankAccountValidation;
}

String _module(int sumSequence) {
  final result = 11 - (sumSequence % 11);
  if (result == 10) {
    return "X";
  }
  if (result == 11) {
    return "0";
  }
  return result.toString();
}
