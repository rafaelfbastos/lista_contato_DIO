import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/modules/auth/auth_module.dart';
import 'package:lista_contatos/app/modules/home/home_module.dart';

import 'modules/auth/auth_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => AuthStore())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute("/auth", module: AuthModule()),
    ModuleRoute("/home", module: HomeModule())
  ];
}
