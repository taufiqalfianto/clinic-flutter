import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasourse _authRemoteDatasourse;
  LogoutBloc(this._authRemoteDatasourse) : super(_Initial()) {
    on<_Logout>((event, emit) async {
      emit(_Loading());
      final Response = await _authRemoteDatasourse.logout();
      Response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Succes()),
      );
    });
  }
}
