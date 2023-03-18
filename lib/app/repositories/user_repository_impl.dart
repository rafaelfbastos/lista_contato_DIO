// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lista_contatos/app/core/exeptions/auth_exception.dart';
import 'package:lista_contatos/app/models/user_model.dart';

import 'package:lista_contatos/app/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late Dio _dio;

  UserRepositoryImpl() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.env["X-Parse-Application-Id"];
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.env["X-Parse-REST-API-Key"];
    _dio.options.headers["Content-Type"] = dotenv.env["Content-Type"];
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes/usuario";
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final url = "?where={ \"email\":\"$email\"}";
    final response = await _dio.get(url);
    final dataList = response.data["results"] as List;
    if (dataList.isNotEmpty) {
      final data = dataList[0] as Map<String, dynamic>;
      final user = UserModel.fromMap(data);
      if (user.password == password) {
        return user;
      } else {
        throw AuthException(message: "Senha inválida");
      }
    } else {
      throw AuthException(message: "Usuário não cadastrado");
    }
  }

  @override
  Future<bool> userIsRegistred(String email) async {
    final url = "?where={ \"email\":\"$email\"}";
    final response = await _dio.get(url);
    final dataList = response.data["results"] as List;

    return (dataList.isNotEmpty) ? true : false;
  }

  @override
  Future<void> saveNewUser(UserModel user) async {
    final response = await _dio.post("", data: user.toJson());
    if (response.statusCode != 201) {
      throw AuthException(message: "Erro ao cadastrar");
    }
  }
}
