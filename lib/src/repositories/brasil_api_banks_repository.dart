import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/brasil_api_model.dart';
import 'interfaces/brasil_api_banks_repository_interface.dart';

class BrasilApiBanksRepository implements IBrasilApiBanksRepository {
  static var banks = <BrasilApiBanksModel>[];

  @override
  loadBanks() async {
    final baseApiUrl = "https://brasilapi.com.br/api";
    final api = "/banks/v1";
    final _uri = Uri.parse("$baseApiUrl$api");
    http.Response _response;

    _response = await http.get(_uri);

    switch (_response?.statusCode) {
      case 200:
        var banks = <BrasilApiBanksModel>[];
        List parsedJson = json.decode(_response.body);
        for (var i = 0; i < parsedJson.length; i++) {
          banks.add(BrasilApiBanksModel.fromJson(parsedJson[i]));
        }
        return banks;
      default:
        throw "Untreated api return";
    }
  }
}
