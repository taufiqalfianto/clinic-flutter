part of 'service_medicine_bloc.dart';

@freezed
class ServiceMedicineEvent with _$ServiceMedicineEvent {
  const factory ServiceMedicineEvent.started() = _Started;
  const factory ServiceMedicineEvent.getservicemedicine() = _GetServiceMedicine;
  const factory ServiceMedicineEvent.getservicemedicinebyname(String name) = _GetServiceMedicineByName;
}