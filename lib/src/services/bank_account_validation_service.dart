import 'package:brazilian_banks/src/controllers/banco_do_brasil_validator.dart';
import 'package:brazilian_banks/src/controllers/bradesco_validator.dart';
import 'package:brazilian_banks/src/controllers/cef_validator.dart';
import 'package:brazilian_banks/src/controllers/itau_validator.dart';
import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';
import 'package:brazilian_banks/src/services/interfaces/bank_account_validation_service_interface.dart';

/// @class Service to validate account number
class BankAccountValidationService extends IBankAccountValidationService {
  BankAccountValidationService._();

  @override
  BankAccountValidation validateAccountNumber({
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