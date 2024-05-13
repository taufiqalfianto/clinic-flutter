part of 'subdistricts_bloc.dart';

@freezed
class SubdistrictsEvent with _$SubdistrictsEvent {
  const factory SubdistrictsEvent.started() = _Started;
  const factory SubdistrictsEvent.getSubDistricts(int districtscode) = _getSubDistricts;
}