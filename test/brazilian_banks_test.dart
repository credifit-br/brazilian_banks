import 'package:flutter_test/flutter_test.dart';

import 'package:brazilian_banks/brazilian_banks.dart';

void main() {
  group('brazilian bank list', () {
    test('an instance of BrasilApiBanksModel is returned', () {
      final brasilApiBanksModel = BrasilApiBanksModel();
      expect(brasilApiBanksModel, isA<BrasilApiBanksModel>());
    });
    test('getBanks returns list of brazilian banks', () async {
      final banks = await BrasilApiBanksModel.getBanks();
      expect(banks.length, greaterThan(0));
      expect(banks[0].name, 'BCO DO BRASIL S.A.');
    });
  });
}
