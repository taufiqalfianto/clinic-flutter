part of 'province_bloc.dart';

@freezed
class ProvinceState with _$ProvinceState {
  const factory ProvinceState.initial() = _Initial;
  const factory ProvinceState.loading() = _Loading;
  const factory ProvinceState.succes(List<Province> province) = _Succes;
  const factory ProvinceState.error() = _Error;
}
