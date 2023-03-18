import 'package:lista_contatos/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> login(String email, String password);
  Future<bool> userIsRegistred(String email);
  Future<void> saveNewUser(UserModel user);
}
