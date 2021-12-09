import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/models/bank_branch_validation_model.dart';

/// @interface Contract bank branch validation service
abstract class IBankBranchValidationService {
  /// @methods Validate brazilian branch number
  BankBranchValidation validateBranchNumber({
    /// @param [bankBranchModel] required for branch number validation
    required BankBranchModel bankBranchModel,
  });
}
