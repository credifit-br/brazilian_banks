import 'package:brazilian_banks/brazilian_banks.dart';
import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:brazilian_banks/src/services/bank_account_validation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('cef account validation', () {
    test('CEF valid digit account', () {
      const validAccountWithDigit = '00000448-6';
      final response = BankAccountValidationService().validateAccountNumber(
        bankAccountModel: BankAccountModel(
          accountNumberWithDigit: validAccountWithDigit,
          accountType: AccountType.checking,
          bankCode: 104,
          branchNumber: '2004',
        ),
      );
      expect(response.isValid, true);
      expect(response.account, '00000448');
      expect(response.digit, '6');
    });
    test('CEF invalid digit account', () {
      const invalidAccountWithDigit = '00000448-5';
      final response = BankAccountValidationService().validateAccountNumber(
        bankAccountModel: BankAccountModel(
          accountNumberWithDigit: invalidAccountWithDigit,
          accountType: AccountType.checking,
          bankCode: 104,
          branchNumber: '2004',
        ),
      );
      expect(response.isValid, false);
      expect(response.account, '00000448');
      expect(response.digit, "6");
    });
  });
}
