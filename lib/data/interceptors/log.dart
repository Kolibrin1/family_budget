// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:family_budget/app/global.dart';

final logInterceptor = InterceptorsWrapper(
  onRequest: (opts, handler) {
    logger.d(
      [
        '${opts.method} ${opts.baseUrl}${opts.path}',
        'headers: ${_prettifyJson(opts.headers)}',
        'query: ${_prettifyJson(opts.queryParameters)}',
        'data: ${_prettifyJson(opts.data)}',
      ].join('\n'),
    );
    handler.next(opts);
  },
  onResponse: (res, handler) {
    final opts = res.requestOptions;
    logger.d(
      [
        'path: ${opts.baseUrl}${opts.path}',
        'headers: ${_prettifyJson(res.headers)}',
        'data: ${_prettifyJson(res.data)}',
      ].join('\n'),
    );
    handler.next(res);
  },
  onError: (err, handler) {
    final opts = err.requestOptions;
    logger.e(
      [
        'path: ${opts.baseUrl}${opts.path}',
        'headers: ${_prettifyJson(err.response?.headers)}',
        'error: ${err.error}',
        'message: ${err.message}',
        'data: ${_prettifyJson(err.response?.data)}',
      ].join('\n'),
    );
    handler.next(err);
  },
);

String _prettifyJson(Object? obj) {
  try {
    return const JsonEncoder.withIndent(' ').convert(obj);
  } catch (e) {
    return '''
CONVERTED BY toString:
---
${obj.toString()}
---
''';
  }
}
