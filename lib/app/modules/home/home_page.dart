import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';
import 'package:lista_contatos/app/modules/auth/auth_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: context.titleStyle,
        ),
      ),
      body: Container(
        child: ElevatedButton(
          child: const Text(
            "Logout",
          ),
          onPressed: () {
            context.read<AuthStore>().logout();
          },
        ),
      ),
    );
  }
}
