import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/master_remote_datasource.dart';
import '../../../../data/models/response/master_patients_response_model.dart';

part 'data_patients_event.dart';
part 'data_patients_state.dart';
part 'data_patients_bloc.freezed.dart';

class DataPatientsBloc extends Bloc<DataPatientsEvent, DataPatientsState> {
  final MasterRemoteDatasource _masterRemoteDatasource;
  DataPatientsBloc(
    this._masterRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetPatients>(
      (event, emit) async {
        emit(_Loading());
        final result = await _masterRemoteDatasource.getPatients();
        result.fold(
          (l) => emit(_Error()),
          (r) => emit(
            _Succes(
              r.data ?? [],
            ),
          ),
        );
      },
    );
    on<_GetPatientsByNik>(
      (event, emit) async {
        emit(_Loading());
        final result = await _masterRemoteDatasource.getDoctorsbyNik(event.nik);
        result.fold(
          (l) => emit(_Error()),
          (r) => emit(
            _Succes(
              r.data ?? [],
            ),
          ),
        );
      },
    );
  }
}
