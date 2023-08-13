import 'package:my_exchange/features/currencies/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel(
      {required super.code,
      required super.currency,
      required super.flag,
      required super.buy,
      required super.sell});

  factory CurrencyModel.fromJson(json) {
    return CurrencyModel(
        code: json['code'],
        currency: json['currency'],
        flag: json['flag'],
        buy: json['buy'],
        sell: json['sell']);
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'currency': currency,
      'flag': flag,
      'buy': buy,
      'sell': sell
    };
  }
}
