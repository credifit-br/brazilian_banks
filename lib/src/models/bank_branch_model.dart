/// BankAccountModel
/// @param branchNumber: 4 digit branch number (agência)
class BankBranchModel {
  /// @var [bankCode] : should receive three digit Brazilian bank code
  final int bankCode;

  /// @var [branchNumber]
  final String branchNumber;

  /// @construct [BankBranchModel]
  BankBranchModel({
    required this.bankCode,
    required this.branchNumber,
  });
}
