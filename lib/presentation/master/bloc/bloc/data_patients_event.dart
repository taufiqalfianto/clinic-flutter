part of 'data_patients_bloc.dart';

@freezed
class DataPatientsEvent with _$DataPatientsEvent {
 const factory DataPatientsEvent.started() = _Started;
  const factory DataPatientsEvent.getpatients() = _GetPatients;
  const factory DataPatientsEvent.getpatientsbynik(String nik) = _GetPatientsByNik;
}