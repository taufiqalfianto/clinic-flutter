import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/schedule_patient_remote_datasource.dart';
import '../../../../data/models/response/patient_schedule_response_model.dart';

part 'patient_schedule_event.dart';
part 'patient_schedule_state.dart';
part 'patient_schedule_bloc.freezed.dart';

class PatientScheduleBloc
    extends Bloc<PatientScheduleEvent, PatientScheduleState> {
  final SchedulePatientRemoteDatasource _schedulePatientRemoteDatasource;
  PatientScheduleBloc(this._schedulePatientRemoteDatasource)
      : super(_Initial()) {
    on<PatientScheduleEvent>(
      (event, emit) async {
        emit(_Loading());
        final result =
            await _schedulePatientRemoteDatasource.getPatientSchedules();

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
