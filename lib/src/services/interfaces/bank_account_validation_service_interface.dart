import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/models/bank_account_validation_model.dart';

/// @interface Contract bank account validation service
abstract class IBankAccountValidationService {
  /// @methods Validate brazilian account number
  BankAccountValidation validateAccountNumber({
    /// @param [bankAccountModel] required for account number validation
    required BankAccountModel bankAccountModel,
  });
}
