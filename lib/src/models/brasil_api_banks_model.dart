import 'package:brazilian_banks/src/repositories/brasil_api_banks_repository.dart';

/// @model Brasil Api Banks Model
/// with BrasilApi banks
class BrasilApiBanks {
  /// @construct BrasilApiBanks
  BrasilApiBanks({
    this.ispb,
    this.name,
    this.code,
    this.fullName,
  });

  /// @var Identifier in the Brazilian Payment System
  final String? ispb;

  /// @var Bank name
  final String? name;

  /// @var Bank code
  final int? code;

  /// @var Bank full name
  final String? fullName;

  /// @methods format json for BrasilApiBanks
  factory BrasilApiBanks.fromJson(Map<String, dynamic> json) => BrasilApiBanks(
        ispb: json["ispb"] as String?,
        name: json["name"] as String?,
        code: json["code"] as int?,
        fullName: json["fullName"] as String?,
      );

  /// @methods getbanks() return a list of banks with object compatible
  static Future<List<BrasilApiBanks>> getBanks() async =>
      BrasilApiBanksRepository().loadBanks();
}
