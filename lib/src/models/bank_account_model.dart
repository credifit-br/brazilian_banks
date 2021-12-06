/// BankAccountModel
/// @param branchNumber: 4 digit branch number (agência)
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
/// @param accountType: checking or saving
class BankAccountModel {
  /// @var [bankCode]: should receive three digit Brazilian bank code
  final int bankCode;

  /// @var [branchNumber]: necessary for some banks validation, such as Itau
  final String branchNumber;

  /// @var [accountNumberWithDigit]: should receive full account number,        /// with digit
  final String accountNumberWithDigit;

  /// @var accountType: checking or saving
  final AccountType accountType;

  /// @construct [BankAccountModel]
  BankAccountModel({
    required this.bankCode,
    required this.branchNumber,
    required this.accountNumberWithDigit,
    required this.accountType,
  });
}

/// @enum [AccountType]
enum AccountType {
  /// @param [checking]: Conta Corrente
  checking,

  /// @param [saving]: Conta Poupança
  saving,
}
