import 'dart:async';

import 'package:dio/dio.dart';
import 'package:family_budget/app/app_router/app_router.dart';
import 'package:family_budget/helpers/constants.dart';
import 'package:family_budget/helpers/functions.dart';
import 'package:family_budget/helpers/preferences.dart';
import 'package:family_budget/widgets/restart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/log.dart';

@lazySingleton
class ApiClient {
  ApiClient(this.prefs, DotEnv env) {
    final url = env.env['API_URL']!;
    // final url = env.env['BASE_URL']!;
    client = Dio(
      BaseOptions(
        baseUrl: url,
        receiveTimeout: const Duration(milliseconds: 15000), // 15 seconds
        connectTimeout: const Duration(milliseconds: 15000),
        sendTimeout: const Duration(milliseconds: 15000),
      ),
    );
    client.interceptors.addAll({
      AppInterceptors(
        prefs,
        dio: client,
        url: url,
        client: this,
      ),
      logInterceptor,
    });
  }

  late Dio client;

  final Preferences prefs;

  DioError? error;
  ErrorInterceptorHandler? handler;
  static const String updatePath = '/auth/refresh';

  void onListener(DioError err, ErrorInterceptorHandler errorHandler) {
    error = err;
    handler = errorHandler;
    dioErrorStream.add(err);
    dioErrorHandlerStream.add(handler);
  }

  final StreamController<DioError?> dioErrorStream =
      StreamController<DioError?>.broadcast();

  final StreamController<ErrorInterceptorHandler?> dioErrorHandlerStream =
      StreamController<ErrorInterceptorHandler?>.broadcast();
}

class AppInterceptors extends Interceptor {
  final Dio dio;
  final String url;
  final Preferences prefs;
  final ApiClient client;

  AppInterceptors(
    this.prefs, {
    required this.dio,
    required this.url,
    required this.client,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path
        .contains('convert?to=')) {
      options.baseUrl = 'https://api.apilayer.com';
      options.headers['apikey'] = '42rYJoyvTsdnmHwTj45WyiNQG1MbfN2V';
    } else if(prefs.checkToken()) {
      options.headers['Authorization'] = 'Bearer ${prefs.getStringByKey('token')}';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('STATUS_CODE: ${err.response?.statusCode},\n '
        'ERROR: ${err.message},\n '
        // 'MESSAGE: ${err.response?.data["message"]},\n '
        'PATH: ${err.requestOptions.path}');
    if (err.requestOptions.path.contains('GetDataKKT')) {
      throw InternalServerErrorException(err.requestOptions);
    }
    if (err.type == DioErrorType.connectionTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    }
    if (err.type == DioErrorType.sendTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    }
    if (err.type == DioErrorType.receiveTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    }
    if (err.type == DioErrorType.badResponse) {
      if (err.response?.statusCode == 301) {
        throw BadRequestException(err.requestOptions);
      } else if (err.response?.statusCode == 401) {
        RestartWidget.restartApp(globalContext);
      } else if (err.response?.statusCode == 403) {
        RestartWidget.restartApp(globalContext);
      } else if (err.response?.statusCode == 404) {
        showMessage(
          message: 'Информация не найдена',
          type: PageState.error,
        );
      }
    }

    if (err.type == DioErrorType.connectionTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    }
    if (err.type == DioErrorType.connectionTimeout) {
      throw DeadlineExceededException(err.requestOptions);
    }
    if (err.type == DioErrorType.connectionError) {
      showMessage(
        message: 'Произошла неизвестная ошибка, повторите попытку позже.',
        type: PageState.error,
      );
      throw InternalServerErrorException(err.requestOptions);
    }
    return handler.next(err);
  }

  @override
  void onResponse(
    response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }
}

class DioClientListener extends StatelessWidget {
  const DioClientListener({
    Key? key,
    this.child,
    this.onFunction,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback? onFunction;

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox();
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Неверный запрос';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Произошла неизвестная ошибка, повторите попытку позже.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Произошел конфликт';
  }
}

class NotFoundException extends DioError {
  NotFoundException({required String message, required super.requestOptions});

  @override
  String toString() {
    return message ?? '';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Интернет-соединение не обнаружено, попробуйте еще раз.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Время ожидания соединения истекло, попробуйте еще раз.';
  }
}
