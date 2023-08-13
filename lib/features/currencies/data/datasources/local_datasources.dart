import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_exchange/core/errors/exceptions.dart';
import 'package:my_exchange/features/currencies/data/models/currency_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource extends Equatable {
  Future<List<CurrencyModel>> getCachedCurrencies();
  Future<Unit> cacheCurrencies(List<CurrencyModel> currencies);
}

const CACHED_POSTS = "CACHED_POSTS";

class LocalDatasourceImp implements LocalDatasource {
  final SharedPreferences sharedPreferences;

  LocalDatasourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheCurrencies(List<CurrencyModel> currencies) async {
    List<dynamic> currenciesJson =
        currencies.map<Map<String, dynamic>?>((currencyModel) {
      return currencyModel.toJson();
    }).toList();

    sharedPreferences.setString(CACHED_POSTS, jsonEncode(currenciesJson));
    return Future.value(unit);
  }

  @override
  Future<List<CurrencyModel>> getCachedCurrencies() {
    String? res = sharedPreferences.getString(CACHED_POSTS);
    if (res != null) {
      List<dynamic> currenciesJson = jsonDecode(res);
      List<CurrencyModel> currenciesModels =
          currenciesJson.map<CurrencyModel>((currencyJson) {
        return CurrencyModel.fromJson(currencyJson);
      }).toList();
      return Future.value(currenciesModels);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}
