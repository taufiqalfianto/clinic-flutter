part of 'cities_bloc.dart';

@freezed
class CitiesState with _$CitiesState {
  const factory CitiesState.initial() = _Initial;
  const factory CitiesState.loading() = _Loading;
  const factory CitiesState.succes(List<City> cities) = _Succes;
  const factory CitiesState.error() = _Error;
}
