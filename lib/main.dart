import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'asroo_store_app.dart';
import 'core/app/bloc_observer.dart';
import 'core/app/env.variables.dart';
import 'core/service/shared_pref/shared_pref.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // env_create
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  // firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // SharedPreference
  await SharedPref().instantiatePreferences();
  // BlocObserver
  Bloc.observer = AppBlocObserver();
  // orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const AsrooStoreApp());
  });
}
