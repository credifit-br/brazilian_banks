import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/models/bank_branch_validation_model.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const _branchLen = 4;

/// Bradesco - 237
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankBranchValidation bradescoBranchValidator(
  BankBranchModel bankBranchModel,
) {
  final _bankBranchValidation = BankBranchValidation();

  final _branch = bankBranchModel.branchNumber
      .replaceAll("-", "")
      .replaceAll(".", "")
      .splitByLength(1);
  final _branchNumber = _branch[0].padLeft(_branchLen, '0');
  final _numbers = _branchNumber.split("");

  var sumSequence = 0;
  var sequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sequence = 5 - i;
    sumSequence += int.parse(_numbers[i]) * sequence;
  }

  final digit = _module(sumSequence);

  _bankBranchValidation.isValid = digit == _branch[1];
  _bankBranchValidation.digit = digit;
  _bankBranchValidation.branch = _branchNumber;

  return _bankBranchValidation;
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
