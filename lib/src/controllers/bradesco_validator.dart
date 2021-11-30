import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const accountLen = 7;

/// Bradesco - 237
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation bradescoValidator(BankAccountModel bankAccountModel) {
  final _bankAccountValidation = BankAccountValidation();

  final _account = bankAccountModel.accountNumberWithDigit
      .replaceAll("-", "")
      .splitByLength(1);
  final _accountNumber = _account[0].padLeft(accountLen, '0');
  final _numbers = _accountNumber.split("");

  var sumSequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sumSequence += multiplyAccordingWeight(int.parse(_numbers[i]), i);
  }

  final digit = module(sumSequence);

  _bankAccountValidation.isValid = digit == _account[1];
  _bankAccountValidation.digit = digit;
  _bankAccountValidation.account = _accountNumber;

  return _bankAccountValidation;
}

String module(int sumSequence) {
  final module = sumSequence % 11;
  if (module == 0) {
    return "0";
  }
  if (module == 1) {
    return "P";
  }
  return (11 - module).toString();
}

int multiplyAccordingWeight(int number, int i) {
  final weight = [2, 7, 6, 5, 4, 3, 2];
  return number * weight[i];
}
