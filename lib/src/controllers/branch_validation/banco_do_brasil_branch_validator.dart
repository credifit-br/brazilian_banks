import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/models/bank_branch_validation_model.dart';

extension on String {
  List<String> splitByLength(int length) =>
      [substring(0, length - length), substring(length - length)];
}

const _branchLen = 4;

/// Banco do Brasil - 001
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankBranchValidation bancoDoBrasilBranchValidator(
  BankBranchModel bankBranchModel,
) {
  final bankBranchValidation = BankBranchValidation();

  final branch =
      bankBranchModel.branchNumber.replaceAll("-", "").splitByLength(1);
  final branchNumber = branch[0].padLeft(_branchLen, '0');
  final numbers = branchNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < numbers.length; i++) {
    sequence = 5 - i;
    sumSequence += int.parse(numbers[i]) * sequence;
  }

  final digit = _module(sumSequence);

  bankBranchValidation.isValid = digit == branch[1];
  bankBranchValidation.digit = digit;
  bankBranchValidation.branch = branchNumber;

  return bankBranchValidation;
}

String _module(int sumSequence) {
  final rest = sumSequence % 11;
  final result = 11 - rest;
  if (rest == 10) {
    return "X";
  }
  if (rest == 11) {
    return "0";
  }
  return result.toString();
}
