part of 'service_medicine_bloc.dart';

@freezed
class ServiceMedicineState with _$ServiceMedicineState {
  const factory ServiceMedicineState.initial() = _Initial;
  const factory ServiceMedicineState.loading() = _Loading;
  const factory ServiceMedicineState.succes(List<ServiceMedicine> servicemedicine) = _Succes;
  const factory ServiceMedicineState.error() = _Error;
}
