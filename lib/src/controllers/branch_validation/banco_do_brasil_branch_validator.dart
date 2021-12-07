import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/models/bank_branch_validation_model.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const _branchLen = 4;

/// Banco do Brasil - 001
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
BankBranchValidation bancoDoBrasilBranchValidator(
  BankBranchModel bankBranchModel,
) {
  final _bankBranchValidation = BankBranchValidation();

  final _branch =
      bankBranchModel.branchNumber.replaceAll("-", "").splitByLength(1);
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
