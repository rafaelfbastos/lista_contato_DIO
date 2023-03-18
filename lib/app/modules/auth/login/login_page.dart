import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';
import 'package:lista_contatos/app/core/ui/messages.dart';
import 'package:lista_contatos/app/core/widgets/default_text_field.dart';
import 'package:lista_contatos/app/modules/auth/login/login_page_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/custom_loader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginPageController> {
  var toDispose = <ReactionDisposer>[];

  @override
  void initState() {
    final loadReact = reaction<bool>((_) => controller.loading, (loading) {
      loading ? CustomLoader.show(context).primary() : Loader.hide();
    });

    final errorReact = reaction<String>((_) => controller.error, (error) {
      if (error.isNotEmpty) {
        Messages.of(context).showError(error);
      }
    });

    toDispose.add(loadReact);
    toDispose.add(errorReact);
    super.initState();
  }

  @override
  void dispose() {
    toDispose.map((e) => e);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailEC = TextEditingController();
    final passwordEC = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Login:',
                    textStyle: context.titleStyle.copyWith(fontSize: 60),
                    colors: [
                      context.primaryColor,
                      context.primaryColorDark,
                      context.primaryColorLigth
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              DefaultTextField(
                validator: Validatorless.multiple([
                  Validatorless.required("Campo obrigatório:"),
                  Validatorless.email("Digite um e-mail válido")
                ]),
                label: "Email",
                textEC: emailEC,
              ),
              const SizedBox(
                height: 15,
              ),
              DefaultTextField(
                validator: Validatorless.multiple(
                    [Validatorless.required("Digite a senha")]),
                label: "Senha",
                textEC: passwordEC,
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8)),
                  child: Text(
                    "entrar",
                    style: context.titleStyle,
                  ),
                  onPressed: () {
                    var formValid = formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      var password = sha1.convert(utf8.encode(passwordEC.text));
                      controller.login(emailEC.text, password.toString());
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Ainda não é cadastrado, "),
                  TextButton(
                    onPressed: () {
                      Modular.to.pushNamed("/auth/register");
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: context.primaryColor),
                    child: const Text("Clique aqui."),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
