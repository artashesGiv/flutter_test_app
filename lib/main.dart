import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'repositories/products/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // talker init
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('APP START');

  // init firebase
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  talker.info(app.options.projectId);

  // init dio & set talker interceptor
  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(),
    ),
  );

  // init repositories
  GetIt.I.registerLazySingleton<AbstractProductsRepository>(
      () => ProductsRepository(dio: dio));

  // set bloc observer
  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: false,
        printEventFullData: false,
      ));

  // set flutter error talker handler
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details);

  // Run `runApp` within `runZonedGuarded` to ensure consistent zone
  runZonedGuarded(
    () {
      runApp(const App());
    },
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}
