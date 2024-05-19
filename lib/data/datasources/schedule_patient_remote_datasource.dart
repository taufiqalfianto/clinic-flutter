import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variable.dart';
import '../models/request/add_reservation_request_model.dart';
import '../models/response/patient_schedule_response_model.dart';
import 'auth_local_datasource.dart';

class SchedulePatientRemoteDatasource {
  Future<Either<String, String>> addReservation(
      AddReservationRequestModel data) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/api-patient-schedules');

    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: data.toJson(),
    );

    if (response.statusCode == 201) {
      return Right('Berhasil Menambahkan Data Reservasi');
    } else {
      return Left('Gagal mendapatkan Data Reservasi');
    }
  }

Future<Either<String, PatientScheduleResponseModel>>
      getPatientSchedules() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/api-patient-schedules');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(PatientScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal menambahkan reservasi');
    }
  }

Future<Either<String, PatientScheduleResponseModel>>
      getPatientSchedulesbyNik(String nik) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variable.baseurl}/api/api-patient-schedules?nik=$nik');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(PatientScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal menambahkan reservasi');
    }
  }
}
