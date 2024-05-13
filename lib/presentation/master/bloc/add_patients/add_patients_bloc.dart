import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/master_remote_datasource.dart';
import '../../../../data/models/request/add_patients_request_model.dart';

part 'add_patients_event.dart';
part 'add_patients_state.dart';
part 'add_patients_bloc.freezed.dart';

class AddPatientsBloc extends Bloc<AddPatientsEvent, AddPatientsState> {
  final MasterRemoteDatasource _masterRemoteDatasource;
  AddPatientsBloc(this._masterRemoteDatasource) : super(_Initial()) {
    on<_AddPatient>((event, emit) async {
      emit(_Loading());
      final result = await _masterRemoteDatasource.addPatients(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(
          _Succes(),
        ),
      );
    });
  }
}
