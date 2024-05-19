part of 'patient_schedule_bloc.dart';

@freezed
class PatientScheduleState with _$PatientScheduleState {
  const factory PatientScheduleState.initial() = _Initial;
  const factory PatientScheduleState.loading() = _Loading;
  const factory PatientScheduleState.succes(List<PatientSchedule> data) = _Succes;
  const factory PatientScheduleState.error() = _Error;
}
