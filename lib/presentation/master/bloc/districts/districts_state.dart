part of 'districts_bloc.dart';

@freezed
class DistrictsState with _$DistrictsState {
  const factory DistrictsState.initial() = _Initial;
  const factory DistrictsState.loading() = _Loading;
  const factory DistrictsState.succes(List<Wilayah> districts) = _Succes;
  const factory DistrictsState.error() = _Error;
}
