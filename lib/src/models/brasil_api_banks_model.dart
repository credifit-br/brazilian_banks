import 'package:brazilian_banks/src/repositories/brasil_api_banks_repository.dart';

/// Brasil Api Banks Model
class BrasilApiBanks {
  BrasilApiBanks({
    this.ispb,
    this.name,
    this.code,
    this.fullName,
  });

  final String? ispb;
  final String? name;
  final int? code;
  final String? fullName;

  factory BrasilApiBanks.fromJson(Map<String, dynamic> json) => BrasilApiBanks(
        ispb: json["ispb"],
        name: json["name"],
        code: json["code"],
        fullName: json["fullName"],
      );

  static Future<List<BrasilApiBanks>> getBanks() async => await BrasilApiBanksRepository().loadBanks();
}
