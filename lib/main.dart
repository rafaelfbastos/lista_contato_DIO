import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lista_contatos/app/app_module.dart';
import 'package:lista_contatos/app/app_widget.dart';
import 'package:path_provider/path_provider.dart';

import 'app/models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Directory appDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDir.path);
  Hive.registerAdapter(UserModelAdapter());

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
