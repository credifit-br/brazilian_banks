import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:brazilian_banks/brazilian_banks.dart';

void main() {
  group('cef account validation', () {
    test('CEF valid digit account', () {
      final validAccountWithDigit = '00000448-6';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          accountNumberWithDigit: validAccountWithDigit,
          accountType: AccountType.checking,
          bankCode: 104,
          branchNumber: '2004',
        ),
      );
      expect(response.isValid, true);
    });
    test('CEF invalid digit account', () {
      final invalidAccountWithDigit = '00000448-5';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          accountNumberWithDigit: invalidAccountWithDigit,
          accountType: AccountType.checking,
          bankCode: 104,
          branchNumber: '2004',
        ),
      );
      expect(response.isValid, false);
      expect(response.digit, "6");
    });
  });
}
