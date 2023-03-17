// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  @override
  Future<void> fetchUser(String email) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}
