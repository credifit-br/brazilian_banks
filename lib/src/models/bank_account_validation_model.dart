import 'package:brazilian_banks/src/controllers/banco_do_brasil_validator.dart';
import 'package:brazilian_banks/src/controllers/bradesco_validator.dart';
import 'package:brazilian_banks/src/controllers/cef_validator.dart';
import 'package:brazilian_banks/src/controllers/itau_validator.dart';
import 'package:brazilian_banks/src/models/bank_account_model.dart';

class BankAccountValidation {
  bool? isValid;
  String? digit;
  String? account;
  String? errorMessage;

  BankAccountValidation({
    this.isValid,
    this.digit,
    this.account,
    this.errorMessage,
  });

  /// @param accountType: checking or saving
  /// @param bankCode: should receive three digit Brazilian bank code
  /// @param branchNumber: necessary for some banks validation, such as Itau
  /// @param accountNumberWithDigit: should receive full account number, with digit
  factory BankAccountValidation.validateAccountNumber({
    required BankAccountModel bankAccountModel,
  }) {
    final _bankAccountValidation = BankAccountValidation();
    switch (bankAccountModel.bankCode) {
      case 001:
        return bancoDoBrasilValidator(bankAccountModel);
      case 237:
        return bradescoValidator(bankAccountModel);
      case 104:
        return cefValidator(bankAccountModel);
      case 341:
        return itauValidator(bankAccountModel);
      default:
        _bankAccountValidation.errorMessage = "banco não suportado";
        return _bankAccountValidation;
    }
  }
}
