import '../../brazilian_banks.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const ACCOUNT_LEN = 5;

/// Itau - 341
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation itauValidator(
    String branchNumber, String accountNumberWithDigit) {
  var _bankAccountValidation = BankAccountValidation();

  final _account = accountNumberWithDigit.replaceAll("-", "").splitByLength(1);
  final _accountNumber = _account[0].padLeft(ACCOUNT_LEN, '0');
  final _branchAndAcccountNumber = branchNumber + _accountNumber;
  final _numbers = _branchAndAcccountNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sequence = multiplyAccordingParity(int.parse(_numbers[i]), i);
    sequence = adjustAccordingLength(sequence);
    sumSequence += sequence;
  }

  var digit = module(sumSequence);

  _bankAccountValidation.isValid = digit == _account[1];
  _bankAccountValidation.digit = digit;
  _bankAccountValidation.account = _accountNumber;

  return _bankAccountValidation;
}

String module(sumSequence) {
  final module = sumSequence % 10;
  if (module == 0) {
    return "0";
  }
  return (10 - module).toString();
}

int multiplyAccordingParity(number, index) {
  return number * (index % 2 == 0 ? 2 : 1);
}

int adjustAccordingLength(sequence) {
  if (sequence > 9) {
    final numbers = sequence.toString().split("");
    sequence = 0;
    for (var i = 0; i < numbers.length; i++) {
      sequence += int.parse(numbers[i]);
    }
  }
  return sequence;
}
