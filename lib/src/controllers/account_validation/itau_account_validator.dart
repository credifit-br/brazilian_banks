import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

extension on String {
  List<String> splitByLength(int l) =>
      [substring(0, length - l), substring(length - l)];
}

const _accountLen = 5;

/// Itau - 341
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation itauAccountValidator(BankAccountModel bankAccountModel) {
  final bankAccountValidation = BankAccountValidation();

  final account = bankAccountModel.accountNumberWithDigit
      .replaceAll("-", "")
      .splitByLength(1);
  final accountNumber = account[0].padLeft(_accountLen, '0');
  final branchAndAcccountNumber = bankAccountModel.branchNumber + accountNumber;
  final numbers = branchAndAcccountNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < numbers.length; i++) {
    sequence = _multiplyAccordingParity(int.parse(numbers[i]), i);
    sequence = _adjustAccordingLength(sequence);
    sumSequence += sequence;
  }

  final digit = _module(sumSequence);

  bankAccountValidation.isValid = digit == account[1];
  bankAccountValidation.digit = digit;
  bankAccountValidation.account = accountNumber;

  return bankAccountValidation;
}

String _module(int sumSequence) {
  final module = sumSequence % 10;
  if (module == 0) {
    return "0";
  }
  return (10 - module).toString();
}

int _multiplyAccordingParity(int number, int index) {
  return number * (index % 2 == 0 ? 2 : 1);
}

int _adjustAccordingLength(int sequence) {
  int sequence0 = sequence;
  if (sequence0 > 9) {
    final numbers = sequence0.toString().split("");
    sequence0 = 0;
    for (var i = 0; i < numbers.length; i++) {
      sequence0 += int.parse(numbers[i]);
    }
  }
  return sequence0;
}
