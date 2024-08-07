import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';
import 'repositories/products/products.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractProductsRepository>(
      () => ProductsRepository(dio: Dio()));
  runApp(const App());
}
