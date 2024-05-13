import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/variable.dart';
import '../models/response/auth_response_model.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasourse {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variable.baseurl}/api/login');

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      await AuthLocalDataSource()
          .savetoken(AuthResponseModel.fromJson(response.body));
      return right(
        AuthResponseModel.fromJson(response.body),
      );
    } else {
      return left(
        response.body,
      );
    }
  }

  Future<Either<String, AuthResponseModel>> logout() async {
    final authdatamodel = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/logout');

    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authdatamodel?.token}',
    });

    if (response.statusCode == 200) {
      return right(
        AuthResponseModel.fromJson(response.body),
      );
    } else {
      return left(
        response.body,
      );
    }
  }

  Future<Either<String, String>> satusehattoken() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/satusehattoken');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return right(jsonDecode(response.body)['token']);
    } else {
      return left('Gagal Mendapatkan Token Satu Sehat');
    }
  }
}
