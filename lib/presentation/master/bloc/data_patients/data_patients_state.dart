part of 'data_patients_bloc.dart';

@freezed
class DataPatientsState with _$DataPatientsState {
    const factory DataPatientsState.initial() = _Initial;
  const factory DataPatientsState.loading() = _Loading;
  const factory DataPatientsState.succes(List<PatientsMaster> patients) = _Succes;
  const factory DataPatientsState.error() = _Error;
}
