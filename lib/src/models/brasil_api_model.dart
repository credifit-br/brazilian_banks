import 'package:brazilian_banks/src/repositories/brasil_api_banks_repository.dart';

/// Brasil Api Banks Model
class BrasilApiBanksModel {
  BrasilApiBanksModel({
    this.ispb,
    this.name,
    this.code,
    this.fullName,
  });

  final String ispb;
  final String name;
  final int code;
  final String fullName;

  factory BrasilApiBanksModel.fromJson(Map<String, dynamic> json) => BrasilApiBanksModel(
        ispb: json["ispb"],
        name: json["name"],
        code: json["code"],
        fullName: json["fullName"],
      );

  static Future<List<BrasilApiBanksModel>> getBanks() async => await BrasilApiBanksRepository().loadBanks();
}
