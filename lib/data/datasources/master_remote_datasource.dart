import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variable.dart';
import '../models/request/add_patients_request_model.dart';
import '../models/response/doctor_schedule_response_model.dart';
import '../models/response/master_doctor_response_model.dart';
import '../models/response/master_patients_response_model.dart';
import '../models/response/service_medicine_response_model.dart';
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

  Future<Either<String, MasterDoctorResponseModel>> getDoctorsbyName(
      String name) async {
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

  Future<Either<String, MasterPatientResponseModel>> getPatientsbyNik(
      String nik) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-patients?nik=$nik');

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

  Future<Either<String, DoctorScheduleResponseModel>>
      getDoctorSchedule() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-doctor-schedule');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(DoctorScheduleResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan jadwal dokter');
    }
  }

  Future<Either<String, DoctorScheduleResponseModel>> getDoctorScheduleByName(
      String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variable.baseurl}/api/get-doctor-schedule?name=$name');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );
    if (response.statusCode == 200) {
      return Right(DoctorScheduleResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan jadwal dokter');
    }
  }

  Future<Either<String, ServiceMedicineResponseModel>>
      getServiceMedicine() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-service-medicine');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(ServiceMedicineResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan perawatan medis');
    }
  }

  Future<Either<String, ServiceMedicineResponseModel>> getServiceMedicineByName(
      String name) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url =
        Uri.parse('${Variable.baseurl}/api/get-service-medicine?name=$name');

    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );
    if (response.statusCode == 200) {
      return Right(ServiceMedicineResponseModel.fromJson(response.body));
    } else {
      return Left('Gagal mendapatkan perawatan medis');
    }
  }

  Future<Either<String, String>> addPatients(
      AddPatientRequestModel data) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/get-patients');

    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
        'Content-Type': 'application/json',
      },
      body: data.toJson(),
    );
    print(response.body);
    if (response.statusCode == 201) {
      return Right('Pasien Berhasil Ditambahkan');
    } else {
      return Left('Gagal mendapatkan perawatan medis');
    }
  }
}
