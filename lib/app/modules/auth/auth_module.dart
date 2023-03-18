import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/modules/auth/auth_controller_pages.dart';
import 'package:lista_contatos/app/modules/auth/home/auth_home_page.dart';
import 'package:lista_contatos/app/modules/auth/login/login_page.dart';
import 'package:lista_contatos/app/modules/auth/register/register_page.dart';
import 'package:lista_contatos/app/repositories/user_repository.dart';
import 'package:lista_contatos/app/repositories/user_repository_impl.dart';
import 'package:lista_contatos/app/services/user_service.dart';
import 'package:lista_contatos/app/services/user_service_impl.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<UserRepository>((i) => UserRepositoryImpl()),
    Bind<UserService>(
        (i) => UserServiceImpl(userRepository: i(), authStore: i())),
    Bind((i) => AuthControllerPages(userServiceImpl: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => AuthHomePage(authStore: Modular.get()),
    ),
    ChildRoute("/login", child: (_, __) => const LoginPage()),
    ChildRoute("/register", child: (_, __) => const RegisterPage()),
  ];
}
