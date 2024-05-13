import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import '../../../../data/models/response/satu sehat/wilayah_response_model.dart';

part 'subdistricts_event.dart';
part 'subdistricts_state.dart';
part 'subdistricts_bloc.freezed.dart';

class SubdistrictsBloc extends Bloc<SubdistrictsEvent, SubdistrictsState> {
  final SatuSehatMasterWilayahRemoteDatasource
      _satuSehatMasterWilayahRemoteDatasource;
  SubdistrictsBloc(this._satuSehatMasterWilayahRemoteDatasource)
      : super(_Initial()) {
    on<_getSubDistricts>((event, emit) async {
      emit(_Loading());
      final result = await _satuSehatMasterWilayahRemoteDatasource
          .getSubDistricts(event.districtscode);

      result.fold(
        (l) => emit(SubdistrictsState.error()),
        (r) => emit(SubdistrictsState.succes(r.data ?? [])),
      );
    });
  }
}
