part of 'add_patients_bloc.dart';

@freezed
class AddPatientsEvent with _$AddPatientsEvent {
  const factory AddPatientsEvent.started() = _Started;
  const factory AddPatientsEvent.addPatient(AddPatientRequestModel data) = _AddPatient;
}