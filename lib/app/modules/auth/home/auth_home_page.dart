import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/models/user_model.dart';
import 'package:lista_contatos/app/modules/auth/auth_store.dart';
import 'package:mobx/mobx.dart';

class AuthHomePage extends StatefulWidget {
  final AuthStore _authStore;

  const AuthHomePage({Key? key, required AuthStore authStore})
      : _authStore = authStore,
        super(key: key);
  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  void initState() {
    reaction<UserModel?>((_) => widget._authStore.userLogged, (userLogged) {
      if (userLogged == null || userLogged.email.isEmpty) {
        Modular.to.navigate("/auth/login");
      } else {
        Modular.to.navigate("/home");
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._authStore.loadingUserOnStart();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
