import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

extension on String {
  List<String> splitByLength(int l) =>
      [substring(0, length - l), substring(length - l)];
}

const _accountLen = 8;

/// Banco do Brasil - 001
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankAccountValidation bancoDoBrasilAccountValidator(
  BankAccountModel bankAccountModel,
) {
  final bankAccountValidation = BankAccountValidation();

  final account = bankAccountModel.accountNumberWithDigit
      .replaceAll("-", "")
      .splitByLength(1);
  final accountNumber = account[0].padLeft(_accountLen, '0');
  final numbers = accountNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < numbers.length; i++) {
    sequence = 9 - i;
    sumSequence += int.parse(numbers[i]) * sequence;
  }

  final digit = _module(sumSequence);

  bankAccountValidation.isValid = digit == account[1];
  bankAccountValidation.digit = digit;
  bankAccountValidation.account = accountNumber;

  return bankAccountValidation;
}

String _module(int sumSequence) {
  final result = 11 - (sumSequence % 11);
  if (result == 10 || result == 11) {
    return "0";
  }
  return result.toString();
}
