import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variable.dart';
import '../models/response/satu sehat/cities_response_model.dart';
import '../models/response/satu sehat/province_response_model.dart';
import '../models/response/satu sehat/wilayah_response_model.dart';

class SatuSehatMasterWilayahRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    // final tokenresult = await AuthRemoteDatasourse().satusehattoken();
    final tokenresult = 'RBseBpGKjZ3kcS0RObPAC7gZCrQk';
    print(tokenresult);
    final token = tokenresult;
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

  Future<Either<String, CityResponseModel>> getCities(int provinceCode) async {
    // final tokenResult = await AuthRemoteDatasourse().satusehattoken();
    // final token = tokenResult.fold((l) => '-', (r) => r);
     final tokenresult = 'RBseBpGKjZ3kcS0RObPAC7gZCrQk';
    print(tokenresult);
    final token = tokenresult;
    final url = Uri.parse(
        '${Variable.satusehatbaseurl}/masterdata/v1/cities?province_codes=$provinceCode');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data kota/kabupaten');
    }
  }

  Future<Either<String, WilayahResponseModel>> getDistricts(
      int cityCode) async {
    // final tokenResult = await AuthRemoteDatasourse().satusehattoken();
    // final token = tokenResult.fold((l) => '-', (r) => r);
     final tokenresult = 'RBseBpGKjZ3kcS0RObPAC7gZCrQk';
    print(tokenresult);
    final token = tokenresult;
    final url = Uri.parse(
        '${Variable.satusehatbaseurl}/masterdata/v1/districts?city_codes=$cityCode');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(WilayahResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data kecamatan');
    }
  }

  Future<Either<String, WilayahResponseModel>> getSubDistricts(
      int districtCode) async {
    // final tokenResult = await AuthRemoteDatasourse().satusehattoken();
    // final token = tokenResult.fold((l) => '-', (r) => r);
     final tokenresult = 'RBseBpGKjZ3kcS0RObPAC7gZCrQk';
    print(tokenresult);
    final token = tokenresult;
    final url = Uri.parse(
        '${Variable.satusehatbaseurl}/masterdata/v1/sub-districts?district_codes=$districtCode');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      return Right(WilayahResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mendapatkan data kelurahan');
    }
  }
}
