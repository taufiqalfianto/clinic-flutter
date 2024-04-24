import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/master_remote_datasource.dart';
import '../../../../data/models/response/doctor_schedule_response_model.dart';

part 'doctor_schedules_event.dart';
part 'doctor_schedules_state.dart';
part 'doctor_schedules_bloc.freezed.dart';

class DoctorSchedulesBloc
    extends Bloc<DoctorSchedulesEvent, DoctorSchedulesState> {
  final MasterRemoteDatasource _masterRemoteDatasource;
  DoctorSchedulesBloc(this._masterRemoteDatasource) : super(_Initial()) {
    on<_GetDoctorSchedules>(
      (event, emit) async {
        emit(_loading());
        final result = await _masterRemoteDatasource.getDoctorSchedule();
        result.fold(
          (l) => emit(_Error()),
          (r) => emit(_Succes(r.data ?? [])),
        );
      },
    );
    on<_GetDoctorSchedulesByName>(
      (event, emit) async {
        emit(_loading());
        final result = await _masterRemoteDatasource.getDoctorScheduleByName(event.name);
        result.fold(
          (l) => emit(_Error()),
          (r) => emit(_Succes(r.data ?? [])),
        );
      },
    );
  }
}
