// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lista_contatos/app/models/user_model.dart';
import 'package:mobx/mobx.dart';

import '../../../core/exeptions/auth_exception.dart';
import '../../../services/user_service_impl.dart';

part 'register_page_controller.g.dart';

class RegisterPageController = RegisterPageControllerBase
    with _$RegisterPageController;

abstract class RegisterPageControllerBase with Store {
  final UserServiceImpl _userServiceImpl;

  @readonly
  String _error = "";
  @readonly
  bool _loading = false;
  @readonly
  bool _success = false;

  @action
  void showLoading() => _loading = true;

  @action
  void hideLoading() => _loading = false;

  @action
  void isSucess() => _success = true;

  @action
  void setError(String error) => _error = error;

  RegisterPageControllerBase({
    required UserServiceImpl userServiceImpl,
  }) : _userServiceImpl = userServiceImpl;

  register(UserModel user) async {
    try {
      showLoading();
      await _userServiceImpl.saveNewUser(user);
      hideLoading();
      isSucess();
    } on AuthException catch (e) {
      hideLoading();
      setError(e.message ?? "Erro ao logar");
    } finally {
      setError("");
    }
  }
}
