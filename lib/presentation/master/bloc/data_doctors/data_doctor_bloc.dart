import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasources/master_remote_datasource.dart';
import '../../../../../data/models/response/master_doctor_response_model.dart';

part 'data_doctor_event.dart';
part 'data_doctor_state.dart';
part 'data_doctor_bloc.freezed.dart';

class DataDoctorBloc extends Bloc<DataDoctorEvent, DataDoctorState> {
  final MasterRemoteDatasource _masterRemoteDatasource;
  DataDoctorBloc(
    this._masterRemoteDatasource,
  ) : super(_Initial()) {
    on<_GetDoctor>(
      (event, emit) async {
        emit(_Loading());
        final result = await _masterRemoteDatasource.getDoctor();
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
    on<_GetDoctorByName>(
      (event, emit) async {
        emit(_Loading());
        final result =
            await _masterRemoteDatasource.getDoctorsbyName(event.doctorname);
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
