import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'asroo_store_app.dart';
import 'core/app/env.variables.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AsrooStoreApp());
}
