import 'package:brazilian_banks/src/controllers/banco_do_brasil_validator.dart';
import 'package:brazilian_banks/src/controllers/bradesco_validator.dart';

class BankAccountValidation {
  late bool isValid;
  late String digit;
  late String account;
  late String errorMessage;

  /// @param accountNumber: should receive full account number, with digit
  /// @param bankCode: should receive three digit Brazilian bank code
  static BankAccountValidation validateAccountNumber({required String accountNumber, required int bankCode}) {
    var _bankAccountValidation = BankAccountValidation();
    switch (bankCode) {
      case 001:
        return bancoDoBrasilValidator(accountNumber);
      case 237:
        return bradescoValidator(accountNumber);
      default:
        _bankAccountValidation.errorMessage = "banco não suportado";
        return _bankAccountValidation;
    }
  }
}
