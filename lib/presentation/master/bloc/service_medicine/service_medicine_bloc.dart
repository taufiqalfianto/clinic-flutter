import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/master_remote_datasource.dart';
import '../../../../data/models/response/service_medicine_response_model.dart';

part 'service_medicine_event.dart';
part 'service_medicine_state.dart';
part 'service_medicine_bloc.freezed.dart';

class ServiceMedicineBloc
    extends Bloc<ServiceMedicineEvent, ServiceMedicineState> {
  final MasterRemoteDatasource _masterRemoteDatasource;
  ServiceMedicineBloc(this._masterRemoteDatasource) : super(_Initial()) {
    on<_GetServiceMedicine>(
      (event, emit) async {
        emit(_Loading());
        final result = await _masterRemoteDatasource.getServiceMedicine();
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

    on<_GetServiceMedicineByName>(
      (event, emit) async {
        emit(_Loading());
        final result = await _masterRemoteDatasource.getServiceMedicineByName(event.name);
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
