import 'package:brazilian_banks/brazilian_banks.dart';
import 'package:brazilian_banks/src/models/bank_account_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('brazilian bank list', () {
    test('an instance of BrasilApiBanksModel is returned', () {
      final brasilApiBanksModel =
          BrasilApiBanks(code: 0, fullName: '', ispb: '', name: '');
      expect(brasilApiBanksModel, isA<BrasilApiBanks>());
    });
    test('getBanks returns list of brazilian banks', () async {
      final banks = await BrasilApiBanks.getBanks();
      expect(banks.length, greaterThan(0));
      expect(banks[0].name, 'BCO DO BRASIL S.A.');
    });
  });

  group('bank account validation', () {
    test('Banco do Brasil valid digit account', () {
      const validAccountWithDigit = '210169-6';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 001,
          branchNumber: '',
          accountNumberWithDigit: validAccountWithDigit,
          accountType: AccountType.checking,
        ),
      );
      expect(response.isValid, true);
    });
    test('Banco do Brasil invalid digit account', () {
      const invalidAccountWithDigit = '210169-X';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 001,
          branchNumber: '',
          accountNumberWithDigit: invalidAccountWithDigit,
          accountType: AccountType.checking,
        ),
      );
      expect(response.isValid, false);
      expect(response.digit, "6");
    });
    test('Bradesco valid digit account', () {
      const validAccountWithDigit = '134562-1';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 237,
          branchNumber: '',
          accountNumberWithDigit: validAccountWithDigit,
          accountType: AccountType.checking,
        ),
      );
      expect(response.isValid, true);
    });

    test('Bradesco invalid digit account', () {
      const invalidAccountWithDigit = '3013570';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 237,
          branchNumber: '',
          accountNumberWithDigit: invalidAccountWithDigit,
          accountType: AccountType.checking,
        ),
      );
      expect(response.isValid, false);
      expect(response.digit, "P");
    });
    test('Itau valid digit account', () {
      const validAccountWithDigit = '02366-1';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 341,
          branchNumber: '2545',
          accountNumberWithDigit: validAccountWithDigit,
          accountType: AccountType.checking,
        ),
      );
      expect(response.isValid, true);
    });
    test('Itau invalid digit account', () {
      const invalidAccountWithDigit = '02366-0';
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 341,
          branchNumber: '2545',
          accountNumberWithDigit: invalidAccountWithDigit,
          accountType: AccountType.checking,
        ),
      );
      expect(response.isValid, false);
      expect(response.digit, "1");
    });
    test('Unsupported Bank', () {
      final response = BankAccountValidation.validateAccountNumber(
        bankAccountModel: BankAccountModel(
          bankCode: 999,
          branchNumber: '',
          accountNumberWithDigit: '',
          accountType: AccountType.checking,
        ),
      );
      expect(response.errorMessage, isNotNull);
    });
  });
}
