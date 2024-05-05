import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import '../../../../data/models/response/satu sehat/province_response_model.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final SatuSehatMasterWilayahRemoteDatasource
      _satuSehatMasterWilayahRemoteDatasource;
  ProvinceBloc(this._satuSehatMasterWilayahRemoteDatasource)
      : super(_Initial()) {
    on<_GetProvince>((event, emit) async {
      emit(_Loading());
      final result =
          await _satuSehatMasterWilayahRemoteDatasource.getProvince();
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
