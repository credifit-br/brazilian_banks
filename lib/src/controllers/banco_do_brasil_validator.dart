import '../../brazilian_banks.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const ACCOUNT_LEN = 8;

/// Banco do Brasil - 001
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation bancoDoBrasilValidator(String accountNumberWithDigit) {
  var _bankAccountValidation = BankAccountValidation();

  final _account = accountNumberWithDigit.replaceAll("-", "").splitByLength(1);
  final _accountNumber = _account[0].padLeft(ACCOUNT_LEN, '0');
  final _numbers = _accountNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sequence = 9 - i;
    sumSequence += int.parse(_numbers[i]) * sequence;
  }

  var digit = module(sumSequence);

  _bankAccountValidation.isValid = digit == _account[1];
  _bankAccountValidation.digit = digit;
  _bankAccountValidation.account = _accountNumber;

  return _bankAccountValidation;
}

String module(sumSequence) {
  final result = 11 - (sumSequence % 11);
  if (result == 10) {
    return "X";
  }
  if (result == 11) {
    return "0";
  }
  return result.toString();
}
