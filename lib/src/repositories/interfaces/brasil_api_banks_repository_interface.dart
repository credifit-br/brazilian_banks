/// @interface Contract for Brasil Api Banks
abstract class IBrasilApiBanksRepository {
  /// @methods Get the Brazilian Banks through the URL
  /// "https://brasilapi.com.br/api/banks/v1""
  Future loadBanks();
}
