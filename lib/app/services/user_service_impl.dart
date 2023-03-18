// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lista_contatos/app/core/exeptions/auth_exception.dart';
import 'package:lista_contatos/app/models/user_model.dart';
import 'package:lista_contatos/app/modules/auth/auth_store.dart';
import 'package:lista_contatos/app/repositories/user_repository_impl.dart';
import 'package:lista_contatos/app/services/user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepositoryImpl _userRepository;
  final AuthStore _authStore;

  UserServiceImpl({
    required UserRepositoryImpl userRepository,
    required AuthStore authStore,
  })  : _authStore = authStore,
        _userRepository = userRepository;

  @override
  Future<void> login(String email, String password) async {
    try {
      final user = await _userRepository.login(email, password);
      _authStore.login(user);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    }
  }

  @override
  Future<bool> userIsRegistred(String email) async =>
      await _userRepository.userIsRegistred(email);

  @override
  Future<void> saveNewUser(UserModel user) async {
    if (await userIsRegistred(user.email)) {
      throw AuthException(message: "E-mail ja cadastrado");
    } else {
      _userRepository.saveNewUser(user);
    }
  }
}
