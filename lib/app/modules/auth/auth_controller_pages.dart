import 'package:mobx/mobx.dart';

import '../../core/exeptions/auth_exception.dart';
import '../../models/user_model.dart';
import '../../services/user_service_impl.dart';

part 'auth_controller_pages.g.dart';

class AuthControllerPages = AuthControllerPagesBase with _$AuthControllerPages;

abstract class AuthControllerPagesBase with Store {
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

  AuthControllerPagesBase({
    required UserServiceImpl userServiceImpl,
  }) : _userServiceImpl = userServiceImpl;

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
