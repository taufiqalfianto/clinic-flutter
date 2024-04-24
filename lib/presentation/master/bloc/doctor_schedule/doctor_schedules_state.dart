part of 'doctor_schedules_bloc.dart';

@freezed
class DoctorSchedulesState with _$DoctorSchedulesState {
  const factory DoctorSchedulesState.initial() = _Initial;
  const factory DoctorSchedulesState.loading() = _loading;
  const factory DoctorSchedulesState.succes(List<DoctorSchedules> doctorschedule) = _Succes;
  const factory DoctorSchedulesState.error() = _Error;
}
