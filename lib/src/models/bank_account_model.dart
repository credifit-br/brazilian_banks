/// BankAccountModel
/// @param branchNumber: 4 digit branch number (agência)
/// @param accountNumberWithDigit: can be in format "#-0" or "#0"
/// @param accountType: checking or saving
class BankAccountModel {
  final int bankCode;
  final String branchNumber;
  final String accountNumberWithDigit;
  final AccountType accountType;

  BankAccountModel(
      {required this.bankCode,
      required this.branchNumber,
      required this.accountNumberWithDigit,
      required this.accountType});
}

/// AccountType
/// @param checking: Conta Corrente
/// @param saving: Conta Poupança
enum AccountType {
  checking,
  saving,
}
