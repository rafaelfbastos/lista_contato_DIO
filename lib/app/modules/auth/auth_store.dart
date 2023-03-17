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
  login(UserModel user) async {
    var box = await Hive.openBox<UserModel>("user");
    await box.add(user);
    _userLogged = user;
  }

  @action
  logout() async {
    var box = await Hive.openBox<UserModel>("user");
    await box.clear();
    _userLogged = UserModel.empty();
  }
}
