import 'package:brazilian_banks/src/controllers/account_validation/banco_do_brasil_account_validator.dart';
import 'package:brazilian_banks/src/controllers/account_validation/bradesco_account_validator.dart';
import 'package:brazilian_banks/src/controllers/account_validation/cef_account_validator.dart';
import 'package:brazilian_banks/src/controllers/account_validation/itau_account_validator.dart';
import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';
import 'package:brazilian_banks/src/services/interfaces/bank_account_validation_service_interface.dart';

/// @class Service to validate account number
class BankAccountValidationService extends IBankAccountValidationService {
  @override
  BankAccountValidation validateAccountNumber({
    required BankAccountModel bankAccountModel,
  }) {
    final bankAccountValidation = BankAccountValidation();
    switch (bankAccountModel.bankCode) {
      case 001:
        return bancoDoBrasilAccountValidator(bankAccountModel);
      case 237:
        return bradescoAccountValidator(bankAccountModel);
      case 104:
        return cefAccountValidator(bankAccountModel);
      case 341:
        return itauAccountValidator(bankAccountModel);
      default:
        bankAccountValidation.errorMessage = "banco não suportado";
        return bankAccountValidation;
    }
  }
}
