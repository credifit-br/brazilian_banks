import 'package:flutter_test/flutter_test.dart';

import 'package:brazilian_banks/brazilian_banks.dart';

void main() {
  group('brazilian bank list', () {
    test('an instance of BrasilApiBanksModel is returned', () {
      final brasilApiBanksModel = BrasilApiBanks(code: 0, fullName: '', ispb: '', name: '');
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
      final validAccountWithDigit = '210169-6';
      final response = BankAccountValidation.validateAccountNumber(
        accountNumber: validAccountWithDigit,
        bankCode: 001,
      );
      expect(response.isValid, true);
    });
    test('Banco do Brasil invalid digit account', () {
      final validAccountWithDigit = '210169-X';
      final response = BankAccountValidation.validateAccountNumber(
        accountNumber: validAccountWithDigit,
        bankCode: 001,
      );
      expect(response.isValid, false);
      expect(response.digit, "6");
    });
    test('Bradesco valid digit account', () {
      final validAccountWithDigit = '134562-1';
      final response = BankAccountValidation.validateAccountNumber(
        accountNumber: validAccountWithDigit,
        bankCode: 237,
      );
      expect(response.isValid, true);
    });

    test('Bradesco invalid digit account', () {
      final validAccountWithDigit = '3013570';
      final response = BankAccountValidation.validateAccountNumber(
        accountNumber: validAccountWithDigit,
        bankCode: 237,
      );
      expect(response.isValid, false);
      expect(response.digit, "P");
    });
    test('Itau', () {
      final response = BankAccountValidation.validateAccountNumber(
        accountNumber: '',
        bankCode: 341,
      );
      expect(response.errorMessage, "banco não suportado");
    });
  });
}
