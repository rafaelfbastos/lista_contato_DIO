import 'package:hive/hive.dart';
import 'package:lista_contatos/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadingUserOnStart() async {
    var box = await Hive.openBox<UserModel>("user");
    _userLogged = (box.isNotEmpty) ? box.getAt(0) : UserModel.empty();
  }

  @action
  login(String email, String password) {
    _userLogged =
        UserModel(email: "email", password: "password", name: "name", id: "id");
  }

  @action
  logout() {
    _userLogged = UserModel.empty();
  }
}
