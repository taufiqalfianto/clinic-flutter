part of 'subdistricts_bloc.dart';

@freezed
class SubdistrictsState with _$SubdistrictsState {
  const factory SubdistrictsState.initial() = _Initial;
  const factory SubdistrictsState.loading() = _Loading;
  const factory SubdistrictsState.succes(List<Wilayah> subdistricts) = _Succes;
  const factory SubdistrictsState.error() = _Error;
}
