import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/sign_in.dart';
import 'package:core/core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  _initDi();

  runApp(const MyApp());
}

void _initDi() {
  serviceLocator
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  serviceLocator
      .registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());

  serviceLocator.registerFactory<AuthInteractor>(
      () => AuthInteractor(authRepository: serviceLocator.get()));
  serviceLocator.registerFactory<ProfileInteractor>(
      () => ProfileInteractor(profileRepository: serviceLocator.get()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
