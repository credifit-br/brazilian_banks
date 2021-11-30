import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const accountLen = 5;

/// Itau - 341
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation itauValidator(BankAccountModel bankAccountModel) {
  final _bankAccountValidation = BankAccountValidation();

  final _account = bankAccountModel.accountNumberWithDigit
      .replaceAll("-", "")
      .splitByLength(1);
  final _accountNumber = _account[0].padLeft(accountLen, '0');
  final _branchAndAcccountNumber =
      bankAccountModel.branchNumber + _accountNumber;
  final _numbers = _branchAndAcccountNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sequence = multiplyAccordingParity(int.parse(_numbers[i]), i);
    sequence = adjustAccordingLength(sequence);
    sumSequence += sequence;
  }

  final digit = module(sumSequence);

  _bankAccountValidation.isValid = digit == _account[1];
  _bankAccountValidation.digit = digit;
  _bankAccountValidation.account = _accountNumber;

  return _bankAccountValidation;
}

String module(int sumSequence) {
  final module = sumSequence % 10;
  if (module == 0) {
    return "0";
  }
  return (10 - module).toString();
}

int multiplyAccordingParity(int number, int index) {
  return number * (index % 2 == 0 ? 2 : 1);
}

int adjustAccordingLength(int sequence) {
  int _sequence = sequence;
  if (_sequence > 9) {
    final numbers = _sequence.toString().split("");
    _sequence = 0;
    for (var i = 0; i < numbers.length; i++) {
      _sequence += int.parse(numbers[i]);
    }
  }
  return _sequence;
}
