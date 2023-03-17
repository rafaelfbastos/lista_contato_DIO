import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';
import 'package:lista_contatos/app/modules/auth/auth_store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: context.titleStyle,
        ),
      ),
      body: Container(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () {
            context.read<AuthStore>().login("email", "password");
          },
        ),
      ),
    );
  }
}
