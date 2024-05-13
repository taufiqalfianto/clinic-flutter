part of 'districts_bloc.dart';

@freezed
class DistrictsEvent with _$DistrictsEvent {
  const factory DistrictsEvent.started() = _Started;
  const factory DistrictsEvent.getDistricts(int cityCode) = _getDistricts;
}