import 'package:brazilian_banks/src/models/bank_branch_model.dart';
import 'package:brazilian_banks/src/services/bank_branch_validation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('bank branch validation', () {
    test('Banco do Brasil valid digit account', () {
      const validBranchWithDigit = '1584-9';
      final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel:
            BankBranchModel(bankCode: 001, branchNumber: validBranchWithDigit),
      );
      expect(response.isValid, true);
    });

    test('Banco do Brasil invalid digit account', () {
      const validBranchWithDigit = '1584-8';
      final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel:
            BankBranchModel(bankCode: 001, branchNumber: validBranchWithDigit),
      );
      expect(response.isValid, false);
      expect(response.digit, "9");
    });

    test('Bradesco valid digit account', () {
      const validBranchWithDigit = '1425-7';
      final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel:
            BankBranchModel(bankCode: 237, branchNumber: validBranchWithDigit),
      );
      expect(response.isValid, true);
    });

    test('Bradesco invalid digit account', () {
      const validBranchWithDigit = '1425-8';
      final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel:
            BankBranchModel(bankCode: 237, branchNumber: validBranchWithDigit),
      );
      expect(response.isValid, false);
      expect(response.digit, "7");
    });

    test('Unsupported bank', () {
      const validBranchWithDigit = '1425-8';
      final response = BankBranchValidationService().validateBranchNumber(
        bankBranchModel:
            BankBranchModel(bankCode: 000, branchNumber: validBranchWithDigit),
      );
      expect(response.isValid, null);
      expect(response.digit, null);
      expect(response.errorMessage, "banco não suportado");
    });
  });
}
