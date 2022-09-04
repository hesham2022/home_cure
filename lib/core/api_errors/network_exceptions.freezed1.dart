// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore: lines_longer_than_80_chars
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, avoid_equals_and_hash_code_on_mutable_classes

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

/// @nodoc
class _$NetworkExceptionsTearOff {
  const _$NetworkExceptionsTearOff();

  RequestCancelled requestCancelled() {
    return RequestCancelled();
  }

  UnauthorisedRequest unauthorisedRequest(String msg) {
    return UnauthorisedRequest(
      msg,
    );
  }

  BadRequest badRequest() {
    return BadRequest();
  }

  NotFound notFound(String reason) {
    return NotFound(
      reason,
    );
  }

  MethodNotAllowed methodNotAllowed() {
    return MethodNotAllowed();
  }

  NotAcceptable notAcceptable() {
    return NotAcceptable();
  }

  RequestTimeout requestTimeout() {
    return RequestTimeout();
  }

  SendTimeout sendTimeout() {
    return SendTimeout();
  }

  Conflict conflict() {
    return Conflict();
  }

  InternalServerError internalServerError() {
    return InternalServerError();
  }

  NotImplemented notImplemented() {
    return NotImplemented();
  }

  ServiceUnavailable serviceUnavailable() {
    return ServiceUnavailable();
  }

  NoInternetConnection noInternetConnection() {
    return NoInternetConnection();
  }

  FormatExceptionNetWork formatExceptionNetWork(String e) {
    return FormatExceptionNetWork(
      e,
    );
  }

  UnableToProcess unableToProcess() {
    return UnableToProcess();
  }

  DefaultError defaultError(String error) {
    return DefaultError(
      error,
    );
  }

  UnexpectedError unexpectedError() {
    return UnexpectedError();
  }
}

/// @nodoc
const $NetworkExceptions = _$NetworkExceptionsTearOff();

/// @nodoc
mixin _$NetworkExceptions {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkExceptionsCopyWith<$Res> {
  factory $NetworkExceptionsCopyWith(
    NetworkExceptions value,
    $Res Function(NetworkExceptions) then,
  ) = _$NetworkExceptionsCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  _$NetworkExceptionsCopyWithImpl(this._value, this._then);

  final NetworkExceptions _value;
  // ignore: unused_field
  final $Res Function(NetworkExceptions) _then;
}

/// @nodoc
abstract class $RequestCancelledCopyWith<$Res> {
  factory $RequestCancelledCopyWith(
    RequestCancelled value,
    $Res Function(RequestCancelled) then,
  ) = _$RequestCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestCancelledCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $RequestCancelledCopyWith<$Res> {
  _$RequestCancelledCopyWithImpl(
    RequestCancelled _value,
    $Res Function(RequestCancelled) _then,
  ) : super(_value, (v) => _then(v as RequestCancelled));

  @override
  RequestCancelled get _value => super._value as RequestCancelled;
}

/// @nodoc

class _$RequestCancelled extends RequestCancelled with DiagnosticableTreeMixin {
  _$RequestCancelled() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.requestCancelled()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.requestCancelled'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RequestCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return requestCancelled();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestCancelled != null) {
      return requestCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return requestCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestCancelled != null) {
      return requestCancelled(this);
    }
    return orElse();
  }
}

abstract class RequestCancelled extends NetworkExceptions {
  factory RequestCancelled() = _$RequestCancelled;
  RequestCancelled._() : super._();
}

/// @nodoc
abstract class $UnauthorisedRequestCopyWith<$Res> {
  factory $UnauthorisedRequestCopyWith(
    UnauthorisedRequest value,
    $Res Function(UnauthorisedRequest) then,
  ) = _$UnauthorisedRequestCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$UnauthorisedRequestCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $UnauthorisedRequestCopyWith<$Res> {
  _$UnauthorisedRequestCopyWithImpl(
    UnauthorisedRequest _value,
    $Res Function(UnauthorisedRequest) _then,
  ) : super(_value, (v) => _then(v as UnauthorisedRequest));

  @override
  UnauthorisedRequest get _value => super._value as UnauthorisedRequest;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(
      UnauthorisedRequest(
        msg == freezed
            ? _value.msg
            : msg // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$UnauthorisedRequest extends UnauthorisedRequest
    with DiagnosticableTreeMixin {
  _$UnauthorisedRequest(this.msg) : super._();

  @override
  final String msg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.unauthorisedRequest(msg: $msg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'NetworkExceptions.unauthorisedRequest'),
      )
      ..add(DiagnosticsProperty('msg', msg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnauthorisedRequest &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(msg);

  @JsonKey(ignore: true)
  @override
  $UnauthorisedRequestCopyWith<UnauthorisedRequest> get copyWith =>
      _$UnauthorisedRequestCopyWithImpl<UnauthorisedRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return unauthorisedRequest(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthorisedRequest != null) {
      return unauthorisedRequest(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return unauthorisedRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unauthorisedRequest != null) {
      return unauthorisedRequest(this);
    }
    return orElse();
  }
}

abstract class UnauthorisedRequest extends NetworkExceptions {
  factory UnauthorisedRequest(String msg) = _$UnauthorisedRequest;
  UnauthorisedRequest._() : super._();

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnauthorisedRequestCopyWith<UnauthorisedRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadRequestCopyWith<$Res> {
  factory $BadRequestCopyWith(
    BadRequest value,
    $Res Function(BadRequest) then,
  ) = _$BadRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$BadRequestCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $BadRequestCopyWith<$Res> {
  _$BadRequestCopyWithImpl(BadRequest _value, $Res Function(BadRequest) _then)
      : super(_value, (v) => _then(v as BadRequest));

  @override
  BadRequest get _value => super._value as BadRequest;
}

/// @nodoc

class _$BadRequest extends BadRequest with DiagnosticableTreeMixin {
  _$BadRequest() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.badRequest()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NetworkExceptions.badRequest'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is BadRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return badRequest();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class BadRequest extends NetworkExceptions {
  factory BadRequest() = _$BadRequest;
  BadRequest._() : super._();
}

/// @nodoc
abstract class $NotFoundCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) then) =
      _$NotFoundCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$NotFoundCopyWithImpl<$Res> extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(NotFound _value, $Res Function(NotFound) _then)
      : super(_value, (v) => _then(v as NotFound));

  @override
  NotFound get _value => super._value as NotFound;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(
      NotFound(
        reason == freezed
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$NotFound extends NotFound with DiagnosticableTreeMixin {
  _$NotFound(this.reason) : super._();

  @override
  final String reason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.notFound(reason: $reason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NetworkExceptions.notFound'))
      ..add(DiagnosticsProperty('reason', reason));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotFound &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(reason);

  @JsonKey(ignore: true)
  @override
  $NotFoundCopyWith<NotFound> get copyWith =>
      _$NotFoundCopyWithImpl<NotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return notFound(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound extends NetworkExceptions {
  factory NotFound(String reason) = _$NotFound;
  NotFound._() : super._();

  String get reason => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotFoundCopyWith<NotFound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodNotAllowedCopyWith<$Res> {
  factory $MethodNotAllowedCopyWith(
    MethodNotAllowed value,
    $Res Function(MethodNotAllowed) then,
  ) = _$MethodNotAllowedCopyWithImpl<$Res>;
}

/// @nodoc
class _$MethodNotAllowedCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $MethodNotAllowedCopyWith<$Res> {
  _$MethodNotAllowedCopyWithImpl(
    MethodNotAllowed _value,
    $Res Function(MethodNotAllowed) _then,
  ) : super(_value, (v) => _then(v as MethodNotAllowed));

  @override
  MethodNotAllowed get _value => super._value as MethodNotAllowed;
}

/// @nodoc

class _$MethodNotAllowed extends MethodNotAllowed with DiagnosticableTreeMixin {
  _$MethodNotAllowed() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.methodNotAllowed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.methodNotAllowed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is MethodNotAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return methodNotAllowed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (methodNotAllowed != null) {
      return methodNotAllowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return methodNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (methodNotAllowed != null) {
      return methodNotAllowed(this);
    }
    return orElse();
  }
}

abstract class MethodNotAllowed extends NetworkExceptions {
  factory MethodNotAllowed() = _$MethodNotAllowed;
  MethodNotAllowed._() : super._();
}

/// @nodoc
abstract class $NotAcceptableCopyWith<$Res> {
  factory $NotAcceptableCopyWith(
    NotAcceptable value,
    $Res Function(NotAcceptable) then,
  ) = _$NotAcceptableCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotAcceptableCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NotAcceptableCopyWith<$Res> {
  _$NotAcceptableCopyWithImpl(
    NotAcceptable _value,
    $Res Function(NotAcceptable) _then,
  ) : super(_value, (v) => _then(v as NotAcceptable));

  @override
  NotAcceptable get _value => super._value as NotAcceptable;
}

/// @nodoc

class _$NotAcceptable extends NotAcceptable with DiagnosticableTreeMixin {
  _$NotAcceptable() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.notAcceptable()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.notAcceptable'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotAcceptable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return notAcceptable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (notAcceptable != null) {
      return notAcceptable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return notAcceptable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (notAcceptable != null) {
      return notAcceptable(this);
    }
    return orElse();
  }
}

abstract class NotAcceptable extends NetworkExceptions {
  factory NotAcceptable() = _$NotAcceptable;
  NotAcceptable._() : super._();
}

/// @nodoc
abstract class $RequestTimeoutCopyWith<$Res> {
  factory $RequestTimeoutCopyWith(
    RequestTimeout value,
    $Res Function(RequestTimeout) then,
  ) = _$RequestTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class _$RequestTimeoutCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $RequestTimeoutCopyWith<$Res> {
  _$RequestTimeoutCopyWithImpl(
    RequestTimeout _value,
    $Res Function(RequestTimeout) _then,
  ) : super(_value, (v) => _then(v as RequestTimeout));

  @override
  RequestTimeout get _value => super._value as RequestTimeout;
}

/// @nodoc

class _$RequestTimeout extends RequestTimeout with DiagnosticableTreeMixin {
  _$RequestTimeout() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.requestTimeout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.requestTimeout'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RequestTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return requestTimeout();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestTimeout != null) {
      return requestTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return requestTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (requestTimeout != null) {
      return requestTimeout(this);
    }
    return orElse();
  }
}

abstract class RequestTimeout extends NetworkExceptions {
  factory RequestTimeout() = _$RequestTimeout;
  RequestTimeout._() : super._();
}

/// @nodoc
abstract class $SendTimeoutCopyWith<$Res> {
  factory $SendTimeoutCopyWith(
    SendTimeout value,
    $Res Function(SendTimeout) then,
  ) = _$SendTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendTimeoutCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $SendTimeoutCopyWith<$Res> {
  _$SendTimeoutCopyWithImpl(
    SendTimeout _value,
    $Res Function(SendTimeout) _then,
  ) : super(_value, (v) => _then(v as SendTimeout));

  @override
  SendTimeout get _value => super._value as SendTimeout;
}

/// @nodoc

class _$SendTimeout extends SendTimeout with DiagnosticableTreeMixin {
  _$SendTimeout() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.sendTimeout()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.sendTimeout'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return sendTimeout();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return sendTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (sendTimeout != null) {
      return sendTimeout(this);
    }
    return orElse();
  }
}

abstract class SendTimeout extends NetworkExceptions {
  factory SendTimeout() = _$SendTimeout;
  SendTimeout._() : super._();
}

/// @nodoc
abstract class $ConflictCopyWith<$Res> {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) then) =
      _$ConflictCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConflictCopyWithImpl<$Res> extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(Conflict _value, $Res Function(Conflict) _then)
      : super(_value, (v) => _then(v as Conflict));

  @override
  Conflict get _value => super._value as Conflict;
}

/// @nodoc

class _$Conflict extends Conflict with DiagnosticableTreeMixin {
  _$Conflict() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.conflict()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'NetworkExceptions.conflict'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Conflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return conflict();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class Conflict extends NetworkExceptions {
  factory Conflict() = _$Conflict;
  Conflict._() : super._();
}

/// @nodoc
abstract class $InternalServerErrorCopyWith<$Res> {
  factory $InternalServerErrorCopyWith(
    InternalServerError value,
    $Res Function(InternalServerError) then,
  ) = _$InternalServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InternalServerErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $InternalServerErrorCopyWith<$Res> {
  _$InternalServerErrorCopyWithImpl(
    InternalServerError _value,
    $Res Function(InternalServerError) _then,
  ) : super(_value, (v) => _then(v as InternalServerError));

  @override
  InternalServerError get _value => super._value as InternalServerError;
}

/// @nodoc

class _$InternalServerError extends InternalServerError
    with DiagnosticableTreeMixin {
  _$InternalServerError() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.internalServerError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty('type', 'NetworkExceptions.internalServerError'),
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InternalServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return internalServerError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return internalServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(this);
    }
    return orElse();
  }
}

abstract class InternalServerError extends NetworkExceptions {
  factory InternalServerError() = _$InternalServerError;
  InternalServerError._() : super._();
}

/// @nodoc
abstract class $NotImplementedCopyWith<$Res> {
  factory $NotImplementedCopyWith(
    NotImplemented value,
    $Res Function(NotImplemented) then,
  ) = _$NotImplementedCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotImplementedCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NotImplementedCopyWith<$Res> {
  _$NotImplementedCopyWithImpl(
    NotImplemented _value,
    $Res Function(NotImplemented) _then,
  ) : super(_value, (v) => _then(v as NotImplemented));

  @override
  NotImplemented get _value => super._value as NotImplemented;
}

/// @nodoc

class _$NotImplemented extends NotImplemented with DiagnosticableTreeMixin {
  _$NotImplemented() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.notImplemented()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.notImplemented'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotImplemented);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return notImplemented();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (notImplemented != null) {
      return notImplemented();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return notImplemented(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (notImplemented != null) {
      return notImplemented(this);
    }
    return orElse();
  }
}

abstract class NotImplemented extends NetworkExceptions {
  factory NotImplemented() = _$NotImplemented;
  NotImplemented._() : super._();
}

/// @nodoc
abstract class $ServiceUnavailableCopyWith<$Res> {
  factory $ServiceUnavailableCopyWith(
    ServiceUnavailable value,
    $Res Function(ServiceUnavailable) then,
  ) = _$ServiceUnavailableCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServiceUnavailableCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $ServiceUnavailableCopyWith<$Res> {
  _$ServiceUnavailableCopyWithImpl(
    ServiceUnavailable _value,
    $Res Function(ServiceUnavailable) _then,
  ) : super(_value, (v) => _then(v as ServiceUnavailable));

  @override
  ServiceUnavailable get _value => super._value as ServiceUnavailable;
}

/// @nodoc

class _$ServiceUnavailable extends ServiceUnavailable
    with DiagnosticableTreeMixin {
  _$ServiceUnavailable() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.serviceUnavailable()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty('type', 'NetworkExceptions.serviceUnavailable'),
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServiceUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return serviceUnavailable();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return serviceUnavailable(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (serviceUnavailable != null) {
      return serviceUnavailable(this);
    }
    return orElse();
  }
}

abstract class ServiceUnavailable extends NetworkExceptions {
  factory ServiceUnavailable() = _$ServiceUnavailable;
  ServiceUnavailable._() : super._();
}

/// @nodoc
abstract class $NoInternetConnectionCopyWith<$Res> {
  factory $NoInternetConnectionCopyWith(
    NoInternetConnection value,
    $Res Function(NoInternetConnection) then,
  ) = _$NoInternetConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoInternetConnectionCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $NoInternetConnectionCopyWith<$Res> {
  _$NoInternetConnectionCopyWithImpl(
    NoInternetConnection _value,
    $Res Function(NoInternetConnection) _then,
  ) : super(_value, (v) => _then(v as NoInternetConnection));

  @override
  NoInternetConnection get _value => super._value as NoInternetConnection;
}

/// @nodoc

class _$NoInternetConnection extends NoInternetConnection
    with DiagnosticableTreeMixin {
  _$NoInternetConnection() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.noInternetConnection()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty('type', 'NetworkExceptions.noInternetConnection'),
    );
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoInternetConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return noInternetConnection();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return noInternetConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection(this);
    }
    return orElse();
  }
}

abstract class NoInternetConnection extends NetworkExceptions {
  factory NoInternetConnection() = _$NoInternetConnection;
  NoInternetConnection._() : super._();
}

/// @nodoc
abstract class $FormatExceptionNetWorkCopyWith<$Res> {
  factory $FormatExceptionNetWorkCopyWith(
    FormatExceptionNetWork value,
    $Res Function(FormatExceptionNetWork) then,
  ) = _$FormatExceptionNetWorkCopyWithImpl<$Res>;
  $Res call({String e});
}

/// @nodoc
class _$FormatExceptionNetWorkCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $FormatExceptionNetWorkCopyWith<$Res> {
  _$FormatExceptionNetWorkCopyWithImpl(
    FormatExceptionNetWork _value,
    $Res Function(FormatExceptionNetWork) _then,
  ) : super(_value, (v) => _then(v as FormatExceptionNetWork));

  @override
  FormatExceptionNetWork get _value => super._value as FormatExceptionNetWork;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(
      FormatExceptionNetWork(
        e == freezed
            ? _value.e
            : e // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$FormatExceptionNetWork extends FormatExceptionNetWork
    with DiagnosticableTreeMixin {
  _$FormatExceptionNetWork(this.e) : super._();

  @override
  final String e;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.formatExceptionNetWork(e: $e)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty(
          'type',
          'NetworkExceptions.formatExceptionNetWork',
        ),
      )
      ..add(DiagnosticsProperty('e', e));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FormatExceptionNetWork &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  $FormatExceptionNetWorkCopyWith<FormatExceptionNetWork> get copyWith =>
      _$FormatExceptionNetWorkCopyWithImpl<FormatExceptionNetWork>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return formatExceptionNetWork(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (formatExceptionNetWork != null) {
      return formatExceptionNetWork(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return formatExceptionNetWork(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (formatExceptionNetWork != null) {
      return formatExceptionNetWork(this);
    }
    return orElse();
  }
}

abstract class FormatExceptionNetWork extends NetworkExceptions {
  factory FormatExceptionNetWork(String e) = _$FormatExceptionNetWork;
  FormatExceptionNetWork._() : super._();

  String get e => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormatExceptionNetWorkCopyWith<FormatExceptionNetWork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnableToProcessCopyWith<$Res> {
  factory $UnableToProcessCopyWith(
    UnableToProcess value,
    $Res Function(UnableToProcess) then,
  ) = _$UnableToProcessCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnableToProcessCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $UnableToProcessCopyWith<$Res> {
  _$UnableToProcessCopyWithImpl(
    UnableToProcess _value,
    $Res Function(UnableToProcess) _then,
  ) : super(_value, (v) => _then(v as UnableToProcess));

  @override
  UnableToProcess get _value => super._value as UnableToProcess;
}

/// @nodoc

class _$UnableToProcess extends UnableToProcess with DiagnosticableTreeMixin {
  _$UnableToProcess() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.unableToProcess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.unableToProcess'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnableToProcess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return unableToProcess();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unableToProcess != null) {
      return unableToProcess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return unableToProcess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unableToProcess != null) {
      return unableToProcess(this);
    }
    return orElse();
  }
}

abstract class UnableToProcess extends NetworkExceptions {
  factory UnableToProcess() = _$UnableToProcess;
  UnableToProcess._() : super._();
}

/// @nodoc
abstract class $DefaultErrorCopyWith<$Res> {
  factory $DefaultErrorCopyWith(
    DefaultError value,
    $Res Function(DefaultError) then,
  ) = _$DefaultErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$DefaultErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $DefaultErrorCopyWith<$Res> {
  _$DefaultErrorCopyWithImpl(
    DefaultError _value,
    $Res Function(DefaultError) _then,
  ) : super(_value, (v) => _then(v as DefaultError));

  @override
  DefaultError get _value => super._value as DefaultError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(
      DefaultError(
        error == freezed
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$DefaultError extends DefaultError with DiagnosticableTreeMixin {
  _$DefaultError(this.error) : super._();

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.defaultError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NetworkExceptions.defaultError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DefaultError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $DefaultErrorCopyWith<DefaultError> get copyWith =>
      _$DefaultErrorCopyWithImpl<DefaultError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return defaultError(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (defaultError != null) {
      return defaultError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return defaultError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (defaultError != null) {
      return defaultError(this);
    }
    return orElse();
  }
}

abstract class DefaultError extends NetworkExceptions {
  factory DefaultError(String error) = _$DefaultError;
  DefaultError._() : super._();

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultErrorCopyWith<DefaultError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnexpectedErrorCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(
    UnexpectedError value,
    $Res Function(UnexpectedError) then,
  ) = _$UnexpectedErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    extends _$NetworkExceptionsCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(
    UnexpectedError _value,
    $Res Function(UnexpectedError) _then,
  ) : super(_value, (v) => _then(v as UnexpectedError));

  @override
  UnexpectedError get _value => super._value as UnexpectedError;
}

/// @nodoc

class _$UnexpectedError extends UnexpectedError with DiagnosticableTreeMixin {
  _$UnexpectedError() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NetworkExceptions.unexpectedError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NetworkExceptions.unexpectedError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnexpectedError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestCancelled,
    required TResult Function(String msg) unauthorisedRequest,
    required TResult Function() badRequest,
    required TResult Function(String reason) notFound,
    required TResult Function() methodNotAllowed,
    required TResult Function() notAcceptable,
    required TResult Function() requestTimeout,
    required TResult Function() sendTimeout,
    required TResult Function() conflict,
    required TResult Function() internalServerError,
    required TResult Function() notImplemented,
    required TResult Function() serviceUnavailable,
    required TResult Function() noInternetConnection,
    required TResult Function(String e) formatExceptionNetWork,
    required TResult Function() unableToProcess,
    required TResult Function(String error) defaultError,
    required TResult Function() unexpectedError,
  }) {
    return unexpectedError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestCancelled,
    TResult Function(String msg)? unauthorisedRequest,
    TResult Function()? badRequest,
    TResult Function(String reason)? notFound,
    TResult Function()? methodNotAllowed,
    TResult Function()? notAcceptable,
    TResult Function()? requestTimeout,
    TResult Function()? sendTimeout,
    TResult Function()? conflict,
    TResult Function()? internalServerError,
    TResult Function()? notImplemented,
    TResult Function()? serviceUnavailable,
    TResult Function()? noInternetConnection,
    TResult Function(String e)? formatExceptionNetWork,
    TResult Function()? unableToProcess,
    TResult Function(String error)? defaultError,
    TResult Function()? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestCancelled value) requestCancelled,
    required TResult Function(UnauthorisedRequest value) unauthorisedRequest,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(NotFound value) notFound,
    required TResult Function(MethodNotAllowed value) methodNotAllowed,
    required TResult Function(NotAcceptable value) notAcceptable,
    required TResult Function(RequestTimeout value) requestTimeout,
    required TResult Function(SendTimeout value) sendTimeout,
    required TResult Function(Conflict value) conflict,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(NotImplemented value) notImplemented,
    required TResult Function(ServiceUnavailable value) serviceUnavailable,
    required TResult Function(NoInternetConnection value) noInternetConnection,
    required TResult Function(FormatExceptionNetWork value)
        formatExceptionNetWork,
    required TResult Function(UnableToProcess value) unableToProcess,
    required TResult Function(DefaultError value) defaultError,
    required TResult Function(UnexpectedError value) unexpectedError,
  }) {
    return unexpectedError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestCancelled value)? requestCancelled,
    TResult Function(UnauthorisedRequest value)? unauthorisedRequest,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(NotFound value)? notFound,
    TResult Function(MethodNotAllowed value)? methodNotAllowed,
    TResult Function(NotAcceptable value)? notAcceptable,
    TResult Function(RequestTimeout value)? requestTimeout,
    TResult Function(SendTimeout value)? sendTimeout,
    TResult Function(Conflict value)? conflict,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(NotImplemented value)? notImplemented,
    TResult Function(ServiceUnavailable value)? serviceUnavailable,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    TResult Function(FormatExceptionNetWork value)? formatExceptionNetWork,
    TResult Function(UnableToProcess value)? unableToProcess,
    TResult Function(DefaultError value)? defaultError,
    TResult Function(UnexpectedError value)? unexpectedError,
    required TResult orElse(),
  }) {
    if (unexpectedError != null) {
      return unexpectedError(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError extends NetworkExceptions {
  factory UnexpectedError() = _$UnexpectedError;
  UnexpectedError._() : super._();
}
