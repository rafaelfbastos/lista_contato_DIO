import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/modules/auth/auth_store.dart';
import 'package:lista_contatos/app/modules/auth/home/auth_home_page.dart';
import 'package:lista_contatos/app/modules/auth/login/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => AuthHomePage(authStore: Modular.get()),
    ),
    ChildRoute("/login", child: (_, __) => const LoginPage()),
  ];
}
