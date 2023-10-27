import 'dart:convert';

import 'package:brazilian_banks/src/models/brasil_api_banks_model.dart';
import 'package:brazilian_banks/src/repositories/interfaces/brasil_api_banks_repository_interface.dart';
import 'package:http/http.dart' as http;

/// @repository Implementation for Brasil Api Banks repository
class BrasilApiBanksRepository implements IBrasilApiBanksRepository {
  @override
  Future<List<BrasilApiBanks>> loadBanks() async {
    const baseApiUrl = "https://brasilapi.com.br/api";
    const api = "/banks/v1";
    final uri = Uri.parse("$baseApiUrl$api");
    http.Response response;

    response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        final banks = <BrasilApiBanks>[];
        final List<dynamic> parsedJson =
            json.decode(response.body) as List<dynamic>;
        for (var i = 0; i < parsedJson.length; i++) {
          banks.add(BrasilApiBanks.fromJson(parsedJson[i] as Map));
        }
        return banks;
      default:
        throw "Untreated api return";
    }
  }
}
