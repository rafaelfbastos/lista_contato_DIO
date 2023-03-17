// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lista_contatos/app/core/exeptions/auth_exception.dart';
import 'package:mobx/mobx.dart';

import 'package:lista_contatos/app/services/user_service_impl.dart';

part 'login_page_controller.g.dart';

class LoginPageController = LoginPageControllerBase with _$LoginPageController;

abstract class LoginPageControllerBase with Store {
  final UserServiceImpl _userServiceImpl;
  @readonly
  String _error = "";
  @readonly
  bool _loading = false;

  LoginPageControllerBase({
    required UserServiceImpl userServiceImpl,
  }) : _userServiceImpl = userServiceImpl;

  @action
  void showLoading() => _loading = true;

  @action
  void hideLoading() => _loading = false;

  @action
  void setError(String error) => _error = error;

  login(String email, String password) async {
    try {
      showLoading();
      await _userServiceImpl.login(email, password);
      hideLoading();
    } on AuthException catch (e) {
      hideLoading();
      setError(e.message ?? "Erro ao logar");
    } finally {
      setError("");
    }
  }
}
