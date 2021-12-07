import 'package:brazilian_banks/src/models/brasil_api_banks_model.dart';
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
}
