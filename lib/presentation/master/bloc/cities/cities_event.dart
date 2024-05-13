part of 'cities_bloc.dart';

@freezed
class CitiesEvent with _$CitiesEvent {
  const factory CitiesEvent.started() = _Started;
  const factory CitiesEvent.getCities(int provinceCode) = _getCity;
}