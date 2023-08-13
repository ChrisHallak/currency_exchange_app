class Currency {
  String flag;
  final String code;
  final String currency;
  final String? buy;
  final String? sell;
  Currency(
      {required this.code,
      required this.currency,
      required this.flag,
      this.buy,
      this.sell});
}
