import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import '../../../../data/models/response/satu sehat/cities_response_model.dart';

part 'cities_event.dart';
part 'cities_state.dart';
part 'cities_bloc.freezed.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final SatuSehatMasterWilayahRemoteDatasource
      _satuSehatMasterWilayahRemoteDatasource;
  CitiesBloc(this._satuSehatMasterWilayahRemoteDatasource) : super(_Initial()) {
    on<_getCity>((event, emit) async {
      emit(_Loading());
      final result = await _satuSehatMasterWilayahRemoteDatasource
          .getCities(event.provinceCode);

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
