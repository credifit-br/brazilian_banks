import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

extension on String {
  List<String> splitByLength(int _length) =>
      [substring(0, length - _length), substring(length - _length)];
}

const _accountLen = 8;
const _multipliers = [8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

/// CEF - Caixa Econômica Federal - 104
/// @param branchNumber: branch (agência) number with 4 digits
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
/// @docs  Example:
/// @docs    Branch: 2004
/// @docs    Account: 00100000448-6
/// @docs      Os três primeiros dígitos da conta são o tipo da conta
/// @docs      (001 para Conta Corrente e 013 para Poupança)
BankAccountValidation cefAccountValidator(BankAccountModel bankAccountModel) {
  final _bankAccountValidation = BankAccountValidation();

  final _account = bankAccountModel.accountNumberWithDigit
      .replaceAll("-", "")
      .replaceAll("001  ", "")
      .replaceAll("013  ", "")
      .splitByLength(1);

  final _accountPrefix =
      bankAccountModel.accountType == AccountType.checking ? '001' : '013';
  final _accountNumber = _accountPrefix + _account[0].padLeft(_accountLen, '0');
  final _branchAndAcccountNumber =
      bankAccountModel.branchNumber + _accountNumber;
  final _numbers = _branchAndAcccountNumber.split("");

  var sumSequence = 0;

  for (var i = 0; i < _numbers.length; i++) {
    sumSequence += int.parse(_numbers[i]) * _multipliers[i];
  }

  final digit = _module(sumSequence * 10);

  _bankAccountValidation.isValid = digit == _account[1];
  _bankAccountValidation.digit = digit;
  _bankAccountValidation.account = _account[0].padLeft(_accountLen, '0');

  return _bankAccountValidation;
}

String _module(int sumSequence) {
  final result = sumSequence % 11;
  if (result == 10) {
    return "0";
  }
  return result.toString();
}
