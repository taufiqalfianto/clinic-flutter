part of 'data_doctor_bloc.dart';

@freezed
class DataDoctorEvent with _$DataDoctorEvent {
  const factory DataDoctorEvent.started() = _Started;
  const factory DataDoctorEvent.getdoctor() = _GetDoctor;
  const factory DataDoctorEvent.getdoctorbyname(String doctorname) = _GetDoctorByName;
  
}