/// @model to validate bank account
class BankAccountValidation {
  /// @var [isValid] true if bank account is valid
  bool? isValid;

  /// @var [digit] bank account check digit
  String? digit;

  /// @var bank [account] without check digit
  String? account;

  /// @var [errorMessage] if bank account is not valid
  String? errorMessage;

  /// @construct [BankAccountValidation]
  BankAccountValidation({
    this.isValid,
    this.digit,
    this.account,
    this.errorMessage,
  });
}
