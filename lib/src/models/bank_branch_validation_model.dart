/// @model to validate bank branch
class BankBranchValidation {
  /// @var [isValid] true if bank branch is valid
  bool? isValid;

  /// @var [digit] bank branch check digit
  String? digit;

  /// @var bank [branch] without check digit
  String? branch;

  /// @var [errorMessage] if bank branch is not valid
  String? errorMessage;

  /// @construct [BankBranchValidation]
  BankBranchValidation({
    this.isValid,
    this.digit,
    this.branch,
    this.errorMessage,
  });
}
