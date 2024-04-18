import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variable.dart';
import '../models/response/master_doctor_response_model.dart';
import '../models/response/master_patients_response_model.dart';
import 'auth_local_datasource.dart';

class MasterRemoteDatasource {
  Future<Either<String, MasterDoctorResponseModel>> getDoctor() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-doctor');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterDoctorResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan data dokter');
    }
  }
  Future<Either<String, MasterDoctorResponseModel>> getDoctorsbyName(String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-doctor?name=$name');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterDoctorResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan data dokter');
    }
  }
   Future<Either<String, MasterPatientResponseModel>> getPatients() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-patients');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterPatientResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan data pasien');
    }
  }
  Future<Either<String, MasterPatientResponseModel>> getDoctorsbyNik(String nik) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-doctor?nik=$nik');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(MasterPatientResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan data pasien');
    }
  }
}
