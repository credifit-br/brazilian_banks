import 'package:brazilian_banks/src/controllers/branch_validation/banco_do_brasil_branch_validator.dart';
import 'package:brazilian_banks/src/controllers/branch_validation/bradesco_branch_validator.dart';
import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/models/bank_branch_validation_model.dart';
import 'package:brazilian_banks/src/services/interfaces/bank_branch_validation_service_interface.dart';

/// @class Service to validate account number
class BankBranchValidationService extends IBankBranchValidationService {
  @override
  BankBranchValidation validateBranchNumber({
    required BankBranchModel bankBranchModel,
  }) {
    final bankBranchValidation = BankBranchValidation();
    switch (bankBranchModel.bankCode) {
      case 001:
        return bancoDoBrasilBranchValidator(bankBranchModel);
      case 237:
        return bradescoBranchValidator(bankBranchModel);
      default:
        bankBranchValidation.errorMessage = "banco não suportado";
        return bankBranchValidation;
    }
  }
}
