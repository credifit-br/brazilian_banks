import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/models/bank_branch_validation_model.dart';

extension on String {
  List<String> splitByLength(int l) =>
      [substring(0, length - l), substring(length - l)];
}

const _branchLen = 4;

/// Bradesco - 237
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankBranchValidation bradescoBranchValidator(
  BankBranchModel bankBranchModel,
) {
  final bankBranchValidation = BankBranchValidation();

  final branch = bankBranchModel.branchNumber
      .replaceAll("-", "")
      .replaceAll(".", "")
      .splitByLength(1);
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
  final result = 11 - (sumSequence % 11);
  if (result == 10) {
    return "P";
  }
  if (result == 11) {
    return "0";
  }
  return result.toString();
}
