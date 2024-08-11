import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'repositories/products/products.dart';

void main() async {
  // Initialize Talker
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);
  talker.debug('APP START');

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(RatingAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ProductDetailsAdapter());

  final productBox = await Hive.openBox<Product>('product-box');
  final productDetailsBox =
      await Hive.openBox<ProductDetails>('product-detail-box');

  // Initialize Dio and add Talker interceptor
  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(),
    ),
  );

  // Initialize repositories
  GetIt.I.registerLazySingleton<AbstractProductsRepository>(
    () => ProductsRepository(
        dio: dio, productBox: productBox, productDetailsBox: productDetailsBox),
  );

  // Set Bloc observer
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  // Set Flutter error Talker handler
  FlutterError.onError = (details) => talker.handle(details);

  // Run the app with error handling in the same zone
  await runZonedGuarded(
    () async {
      // Ensure Flutter bindings are initialized before other operations
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      runApp(const App());
    },
    (error, stack) => talker.handle(error, stack),
  );
}
