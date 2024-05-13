part of 'add_patients_bloc.dart';

@freezed
class AddPatientsState with _$AddPatientsState {
  const factory AddPatientsState.initial() = _Initial;
  const factory AddPatientsState.loading() = _Loading;
  const factory AddPatientsState.succes() = _Succes;
  const factory AddPatientsState.error(String message) = _Error;
}
