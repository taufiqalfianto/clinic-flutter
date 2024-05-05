import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variable.dart';
import '../models/response/satu sehat/province_response_model.dart';
import 'auth_remote_datasource.dart';

class SatuSehatMasterWilayahRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    final tokenresult = await AuthRemoteDatasourse().satusehattoken();
    final token = tokenresult.fold((l) => '-', (r) => r);
    final url =
        Uri.parse('${Variable.satusehatbaseurl}/masterdata/v1/provinces?codes');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data provinsi');
    }
  }
}
