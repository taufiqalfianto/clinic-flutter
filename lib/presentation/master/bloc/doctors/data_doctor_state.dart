part of 'data_doctor_bloc.dart';

@freezed
class DataDoctorState with _$DataDoctorState {
  const factory DataDoctorState.initial() = _Initial;
  const factory DataDoctorState.loading() = _Loading;
  const factory DataDoctorState.succes(List<DoctorMaster> doctors) = _Succes;
  const factory DataDoctorState.error() = _Error;
}
