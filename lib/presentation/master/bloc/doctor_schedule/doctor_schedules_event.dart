part of 'doctor_schedules_bloc.dart';

@freezed
class DoctorSchedulesEvent with _$DoctorSchedulesEvent {
  const factory DoctorSchedulesEvent.started() = _Started;
  const factory DoctorSchedulesEvent.getdoctorschedule() = _GetDoctorSchedules;
  const factory DoctorSchedulesEvent.getdoctorschedulebyname(String name) = _GetDoctorSchedulesByName;
}