import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:my_exchange/core/errors/exceptions.dart';

import '../models/currency_model.dart';

abstract class RemoteDatasource extends Equatable {
  Future<List<CurrencyModel>> getAllCurrencies();
}

String BASE_URL = 'https://mychangeab.se/exchange/api/list.php';

class RemoteDatasourceImp implements RemoteDatasource {
  final Client client;

  RemoteDatasourceImp({required this.client});
  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    Response response = await client.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      List<dynamic> currenciesJson = jsonDecode(response.body);
      List<CurrencyModel> allCurrencies = currenciesJson
          .map<CurrencyModel>(
              (jsonCurrency) => CurrencyModel.fromJson(jsonCurrency))
          .toList();
      return allCurrencies;
    } else {
      throw ServerException();
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
