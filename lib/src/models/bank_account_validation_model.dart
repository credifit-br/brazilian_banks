import 'package:brazilian_banks/src/controllers/banco_do_brasil_validator.dart';
import 'package:brazilian_banks/src/controllers/bradesco_validator.dart';
import 'package:brazilian_banks/src/controllers/itau_validator.dart';

class BankAccountValidation {
  bool? isValid;
  String? digit;
  String? account;
  String? errorMessage;

  /// @param accountNumber: should receive full account number, with digit
  /// @param bankCode: should receive three digit Brazilian bank code
  static BankAccountValidation validateAccountNumber({
    required String branchNumber,
    required String accountNumberWithDigit,
    required int bankCode,
  }) {
    var _bankAccountValidation = BankAccountValidation();
    switch (bankCode) {
      case 001:
        return bancoDoBrasilValidator(accountNumberWithDigit);
      case 237:
        return bradescoValidator(accountNumberWithDigit);
      case 341:
        return itauValidator(branchNumber, accountNumberWithDigit);
      default:
        _bankAccountValidation.errorMessage = "banco não suportado";
        return _bankAccountValidation;
    }
  }
}
