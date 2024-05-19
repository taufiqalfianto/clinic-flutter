// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientScheduleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPatientSchedule,
    required TResult Function(String nik) getPatientSchedulebyNik,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPatientSchedule,
    TResult? Function(String nik)? getPatientSchedulebyNik,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPatientSchedule,
    TResult Function(String nik)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_getPatientSchedule value) getPatientSchedule,
    required TResult Function(_getPatientSchedulebyNik value)
        getPatientSchedulebyNik,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_getPatientSchedule value)? getPatientSchedule,
    TResult? Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_getPatientSchedule value)? getPatientSchedule,
    TResult Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientScheduleEventCopyWith<$Res> {
  factory $PatientScheduleEventCopyWith(PatientScheduleEvent value,
          $Res Function(PatientScheduleEvent) then) =
      _$PatientScheduleEventCopyWithImpl<$Res, PatientScheduleEvent>;
}

/// @nodoc
class _$PatientScheduleEventCopyWithImpl<$Res,
        $Val extends PatientScheduleEvent>
    implements $PatientScheduleEventCopyWith<$Res> {
  _$PatientScheduleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PatientScheduleEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PatientScheduleEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPatientSchedule,
    required TResult Function(String nik) getPatientSchedulebyNik,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPatientSchedule,
    TResult? Function(String nik)? getPatientSchedulebyNik,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPatientSchedule,
    TResult Function(String nik)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_getPatientSchedule value) getPatientSchedule,
    required TResult Function(_getPatientSchedulebyNik value)
        getPatientSchedulebyNik,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_getPatientSchedule value)? getPatientSchedule,
    TResult? Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_getPatientSchedule value)? getPatientSchedule,
    TResult Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PatientScheduleEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$getPatientScheduleImplCopyWith<$Res> {
  factory _$$getPatientScheduleImplCopyWith(_$getPatientScheduleImpl value,
          $Res Function(_$getPatientScheduleImpl) then) =
      __$$getPatientScheduleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$getPatientScheduleImplCopyWithImpl<$Res>
    extends _$PatientScheduleEventCopyWithImpl<$Res, _$getPatientScheduleImpl>
    implements _$$getPatientScheduleImplCopyWith<$Res> {
  __$$getPatientScheduleImplCopyWithImpl(_$getPatientScheduleImpl _value,
      $Res Function(_$getPatientScheduleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$getPatientScheduleImpl implements _getPatientSchedule {
  const _$getPatientScheduleImpl();

  @override
  String toString() {
    return 'PatientScheduleEvent.getPatientSchedule()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$getPatientScheduleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPatientSchedule,
    required TResult Function(String nik) getPatientSchedulebyNik,
  }) {
    return getPatientSchedule();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPatientSchedule,
    TResult? Function(String nik)? getPatientSchedulebyNik,
  }) {
    return getPatientSchedule?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPatientSchedule,
    TResult Function(String nik)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) {
    if (getPatientSchedule != null) {
      return getPatientSchedule();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_getPatientSchedule value) getPatientSchedule,
    required TResult Function(_getPatientSchedulebyNik value)
        getPatientSchedulebyNik,
  }) {
    return getPatientSchedule(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_getPatientSchedule value)? getPatientSchedule,
    TResult? Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
  }) {
    return getPatientSchedule?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_getPatientSchedule value)? getPatientSchedule,
    TResult Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) {
    if (getPatientSchedule != null) {
      return getPatientSchedule(this);
    }
    return orElse();
  }
}

abstract class _getPatientSchedule implements PatientScheduleEvent {
  const factory _getPatientSchedule() = _$getPatientScheduleImpl;
}

/// @nodoc
abstract class _$$getPatientSchedulebyNikImplCopyWith<$Res> {
  factory _$$getPatientSchedulebyNikImplCopyWith(
          _$getPatientSchedulebyNikImpl value,
          $Res Function(_$getPatientSchedulebyNikImpl) then) =
      __$$getPatientSchedulebyNikImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String nik});
}

/// @nodoc
class __$$getPatientSchedulebyNikImplCopyWithImpl<$Res>
    extends _$PatientScheduleEventCopyWithImpl<$Res,
        _$getPatientSchedulebyNikImpl>
    implements _$$getPatientSchedulebyNikImplCopyWith<$Res> {
  __$$getPatientSchedulebyNikImplCopyWithImpl(
      _$getPatientSchedulebyNikImpl _value,
      $Res Function(_$getPatientSchedulebyNikImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nik = null,
  }) {
    return _then(_$getPatientSchedulebyNikImpl(
      null == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getPatientSchedulebyNikImpl implements _getPatientSchedulebyNik {
  const _$getPatientSchedulebyNikImpl(this.nik);

  @override
  final String nik;

  @override
  String toString() {
    return 'PatientScheduleEvent.getPatientSchedulebyNik(nik: $nik)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getPatientSchedulebyNikImpl &&
            (identical(other.nik, nik) || other.nik == nik));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nik);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getPatientSchedulebyNikImplCopyWith<_$getPatientSchedulebyNikImpl>
      get copyWith => __$$getPatientSchedulebyNikImplCopyWithImpl<
          _$getPatientSchedulebyNikImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getPatientSchedule,
    required TResult Function(String nik) getPatientSchedulebyNik,
  }) {
    return getPatientSchedulebyNik(nik);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getPatientSchedule,
    TResult? Function(String nik)? getPatientSchedulebyNik,
  }) {
    return getPatientSchedulebyNik?.call(nik);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getPatientSchedule,
    TResult Function(String nik)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) {
    if (getPatientSchedulebyNik != null) {
      return getPatientSchedulebyNik(nik);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_getPatientSchedule value) getPatientSchedule,
    required TResult Function(_getPatientSchedulebyNik value)
        getPatientSchedulebyNik,
  }) {
    return getPatientSchedulebyNik(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_getPatientSchedule value)? getPatientSchedule,
    TResult? Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
  }) {
    return getPatientSchedulebyNik?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_getPatientSchedule value)? getPatientSchedule,
    TResult Function(_getPatientSchedulebyNik value)? getPatientSchedulebyNik,
    required TResult orElse(),
  }) {
    if (getPatientSchedulebyNik != null) {
      return getPatientSchedulebyNik(this);
    }
    return orElse();
  }
}

abstract class _getPatientSchedulebyNik implements PatientScheduleEvent {
  const factory _getPatientSchedulebyNik(final String nik) =
      _$getPatientSchedulebyNikImpl;

  String get nik;
  @JsonKey(ignore: true)
  _$$getPatientSchedulebyNikImplCopyWith<_$getPatientSchedulebyNikImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PatientScheduleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PatientSchedule> data) succes,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PatientSchedule> data)? succes,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PatientSchedule> data)? succes,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succes value) succes,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Succes value)? succes,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientScheduleStateCopyWith<$Res> {
  factory $PatientScheduleStateCopyWith(PatientScheduleState value,
          $Res Function(PatientScheduleState) then) =
      _$PatientScheduleStateCopyWithImpl<$Res, PatientScheduleState>;
}

/// @nodoc
class _$PatientScheduleStateCopyWithImpl<$Res,
        $Val extends PatientScheduleState>
    implements $PatientScheduleStateCopyWith<$Res> {
  _$PatientScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PatientScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PatientScheduleState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PatientSchedule> data) succes,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PatientSchedule> data)? succes,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PatientSchedule> data)? succes,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succes value) succes,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Succes value)? succes,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PatientScheduleState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PatientScheduleStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PatientScheduleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PatientSchedule> data) succes,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PatientSchedule> data)? succes,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PatientSchedule> data)? succes,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succes value) succes,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Succes value)? succes,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PatientScheduleState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccesImplCopyWith<$Res> {
  factory _$$SuccesImplCopyWith(
          _$SuccesImpl value, $Res Function(_$SuccesImpl) then) =
      __$$SuccesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PatientSchedule> data});
}

/// @nodoc
class __$$SuccesImplCopyWithImpl<$Res>
    extends _$PatientScheduleStateCopyWithImpl<$Res, _$SuccesImpl>
    implements _$$SuccesImplCopyWith<$Res> {
  __$$SuccesImplCopyWithImpl(
      _$SuccesImpl _value, $Res Function(_$SuccesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccesImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PatientSchedule>,
    ));
  }
}

/// @nodoc

class _$SuccesImpl implements _Succes {
  const _$SuccesImpl(final List<PatientSchedule> data) : _data = data;

  final List<PatientSchedule> _data;
  @override
  List<PatientSchedule> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PatientScheduleState.succes(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccesImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccesImplCopyWith<_$SuccesImpl> get copyWith =>
      __$$SuccesImplCopyWithImpl<_$SuccesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PatientSchedule> data) succes,
    required TResult Function() error,
  }) {
    return succes(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PatientSchedule> data)? succes,
    TResult? Function()? error,
  }) {
    return succes?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PatientSchedule> data)? succes,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succes value) succes,
    required TResult Function(_Error value) error,
  }) {
    return succes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_Error value)? error,
  }) {
    return succes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Succes value)? succes,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (succes != null) {
      return succes(this);
    }
    return orElse();
  }
}

abstract class _Succes implements PatientScheduleState {
  const factory _Succes(final List<PatientSchedule> data) = _$SuccesImpl;

  List<PatientSchedule> get data;
  @JsonKey(ignore: true)
  _$$SuccesImplCopyWith<_$SuccesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PatientScheduleStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'PatientScheduleState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PatientSchedule> data) succes,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PatientSchedule> data)? succes,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PatientSchedule> data)? succes,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Succes value) succes,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Succes value)? succes,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Succes value)? succes,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PatientScheduleState {
  const factory _Error() = _$ErrorImpl;
}
