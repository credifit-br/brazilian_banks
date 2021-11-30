import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/brasil_api_banks_model.dart';
import 'interfaces/brasil_api_banks_repository_interface.dart';

/// Implementation for Brasil Api Banks repository
class BrasilApiBanksRepository implements IBrasilApiBanksRepository {
  static List<BrasilApiBanks> banks = [];

  @override
  Future<List<BrasilApiBanks>> loadBanks() async {
    const baseApiUrl = "https://brasilapi.com.br/api";
    const api = "/banks/v1";
    final _uri = Uri.parse("$baseApiUrl$api");
    http.Response _response;

    _response = await http.get(_uri);

    switch (_response.statusCode) {
      case 200:
        final banks = <BrasilApiBanks>[];
        final List<Map<String, dynamic>> parsedJson =
            json.decode(_response.body) as List<Map<String, dynamic>>;
        for (var i = 0; i < parsedJson.length; i++) {
          banks.add(BrasilApiBanks.fromJson(parsedJson[i]));
        }
        return banks;
      default:
        throw "Untreated api return";
    }
  }
}
