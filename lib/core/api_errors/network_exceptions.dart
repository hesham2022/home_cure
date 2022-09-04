// ignore_for_file: unused_element,avoid_dynamic_calls

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_cure/core/api_errors/app_error.dart';

// part 'test.freezed.dart';
part 'network_exceptions.freezed1.dart';

@freezed
abstract class NetworkExceptions extends AppError with _$NetworkExceptions {
  factory NetworkExceptions(dynamic error) {
    if (error is Exception) {
      try {
        //   NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              return NetworkExceptions.requestCancelled();

            case DioErrorType.connectTimeout:
              return NetworkExceptions.requestTimeout();

            case DioErrorType.other:
              return NetworkExceptions.noInternetConnection();
            case DioErrorType.receiveTimeout:
              return NetworkExceptions.sendTimeout();

            case DioErrorType.response:
              final data = error.response!.data as Map<String, dynamic>;

              switch (error.response!.statusCode) {
                case 400:
                  return NetworkExceptions.unauthorisedRequest(
                    data['message']! as String,
                  );

                case 401:
                  return NetworkExceptions.unauthorisedRequest(
                    data['message']! as String,
                  );

                case 403:
                  return NetworkExceptions.unauthorisedRequest(
                    data['message']! as String,
                  );

                case 404:
                  return NetworkExceptions.notFound('Not found');

                case 409:
                  return NetworkExceptions.conflict();

                case 408:
                  return NetworkExceptions.requestTimeout();

                case 500:
                  return NetworkExceptions.internalServerError();

                case 503:
                  return NetworkExceptions.serviceUnavailable();

                default:
                  final responseCode = error.response!.statusCode;
                  return NetworkExceptions.defaultError(
                    'Received invalid status code: $responseCode',
                  );
              }

            case DioErrorType.sendTimeout:
              return NetworkExceptions.sendTimeout();

            // case DioErrorType.other:

            //   break;
          }
        } else if (error is SocketException) {
          return NetworkExceptions.noInternetConnection();
        } else {
          return NetworkExceptions.unexpectedError();
        }
        // return networkExceptions;
        //   // ignore: unused_catch_clause
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return NetworkExceptions.formatExceptionNetWork(e.toString());
      } catch (_) {
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }
  NetworkExceptions._();
  factory NetworkExceptions.requestCancelled() = RequestCancelled;

  factory NetworkExceptions.unauthorisedRequest(String msg) =
      UnauthorisedRequest;
  factory NetworkExceptions.badRequest() = BadRequest;
  factory NetworkExceptions.notFound(String reason) = NotFound;
  factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;
  factory NetworkExceptions.notAcceptable() = NotAcceptable;
  factory NetworkExceptions.requestTimeout() = RequestTimeout;
  factory NetworkExceptions.sendTimeout() = SendTimeout;
  factory NetworkExceptions.conflict() = Conflict;
  factory NetworkExceptions.internalServerError() = InternalServerError;
  factory NetworkExceptions.notImplemented() = NotImplemented;
  factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;
  factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  factory NetworkExceptions.formatExceptionNetWork(String e) =
      FormatExceptionNetWork;
  factory NetworkExceptions.unableToProcess() = UnableToProcess;
  factory NetworkExceptions.defaultError(String error) = DefaultError;

  factory NetworkExceptions.unexpectedError() = UnexpectedError;
  @override
  String get errorMessege => when(
        notImplemented: () => 'Not Implemented',
        requestCancelled: () => 'Request Cancelled',
        internalServerError: () => 'Internal Server Error',
        notFound: (String reason) => reason,
        serviceUnavailable: () => 'Service unavailable',
        methodNotAllowed: () => 'Method Allowed',
        badRequest: () => 'Bad request',
        unauthorisedRequest: (s) => s,
        unexpectedError: () => 'Unexpected error occurred',
        requestTimeout: () => 'Connection request timeout',
        noInternetConnection: () => 'No internet connection',
        conflict: () => 'Error due to a conflict',
        sendTimeout: () => 'Send timeout in connection with API server',
        unableToProcess: () => 'Unable to process the data',
        defaultError: (String error) => error,
        formatExceptionNetWork: (a) => 'Unexpected error occurred',
        notAcceptable: () => 'Not acceptable',
      );
  // return errorMessage;

}
