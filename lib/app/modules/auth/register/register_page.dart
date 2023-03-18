import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:lista_contatos/app/core/extensions/theme_extensions.dart';
import 'package:lista_contatos/app/core/widgets/default_text_field.dart';
import 'package:lista_contatos/app/models/user_model.dart';
import 'package:lista_contatos/app/modules/auth/register/register_page_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/custom_loader.dart';
import '../../../core/ui/messages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterPageController> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passworEC = TextEditingController();
  final confirmPassworEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
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

    final sucessReact = reaction<bool>((_) => controller.success, (success) {
      if (success) {
        Messages.of(context).showInfo("Cadastro realizado com sucesso");
        Modular.to.pop();
      }
    });

    toDispose.add(loadReact);
    toDispose.add(errorReact);
    toDispose.add(sucessReact);
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    toDispose.map((e) => e);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registre-se',
          style: context.titleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              DefaultTextField(
                label: "Nome",
                textEC: nameEC,
                validator: Validatorless.required("Campo obrigatório"),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: "Email",
                textEC: emailEC,
                validator: Validatorless.multiple([
                  Validatorless.required("Campo obrigatório"),
                  Validatorless.email("Digite um e-mail válido")
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                obscureText: true,
                label: "Senha",
                textEC: passworEC,
                validator: Validatorless.multiple([
                  Validatorless.required("Campo obrigatório"),
                  Validatorless.min(6, "Senha muito curta")
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                obscureText: true,
                label: "Confirmação de senha",
                textEC: confirmPassworEC,
                validator: Validatorless.multiple([
                  Validatorless.required("Campo obrigatório"),
                  Validatorless.min(6, "Senha muito curta"),
                  Validatorless.compare(passworEC, "Digite senhas iguais")
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8)),
                  child: Text(
                    "Cadastrar",
                    style: context.titleStyle,
                  ),
                  onPressed: () {
                    final formValid = formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final name = nameEC.text;
                      final email = emailEC.text;
                      var password = utf8.encode(passworEC.text);

                      final user = UserModel(
                          email: email,
                          password: sha1.convert(password).toString(),
                          name: name);
                      controller.register(user);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
