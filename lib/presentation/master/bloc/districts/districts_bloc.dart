import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import '../../../../data/models/response/satu sehat/wilayah_response_model.dart';

part 'districts_event.dart';
part 'districts_state.dart';
part 'districts_bloc.freezed.dart';

class DistrictsBloc extends Bloc<DistrictsEvent, DistrictsState> {
  final SatuSehatMasterWilayahRemoteDatasource
      _satuSehatMasterWilayahRemoteDatasource;
  DistrictsBloc(this._satuSehatMasterWilayahRemoteDatasource)
      : super(_Initial()) {
    on<_getDistricts>((event, emit) async {
      emit(_Loading());
      final result = await _satuSehatMasterWilayahRemoteDatasource
          .getDistricts(event.cityCode);

      result.fold(
        (l) => emit(_Error()),
        (r) => emit(
          _Succes(
            r.data ?? [],
          ),
        ),
      );
    });
  }
}
