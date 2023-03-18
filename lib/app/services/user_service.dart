import '../models/user_model.dart';

abstract class UserService {
  Future<void> login(String email, String password);
  Future<bool> userIsRegistred(String email);
  Future<void> saveNewUser(UserModel user);
}
