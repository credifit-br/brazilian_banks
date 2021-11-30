import 'package:brazilian_banks/src/repositories/brasil_api_banks_repository.dart';

/// Brasil Api Banks Model
/// getbanks() return a list of banks with object compatible with BrasilApi banks
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
        ispb: json["ispb"] as String?,
        name: json["name"] as String?,
        code: json["code"] as int?,
        fullName: json["fullName"] as String?,
      );

  static Future<List<BrasilApiBanks>> getBanks() async =>
      BrasilApiBanksRepository().loadBanks();
}
