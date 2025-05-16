import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on DateTime {
  String get formatTransactionDate {
    String dateFormat = DateFormat("dd.MM.yyyy", "ru").format(this);
    dateFormat = dateFormat.substring(0, 6) + dateFormat.substring(8, 10);
    return dateFormat;
  }

  String get formatDate {
    String dateFormat = DateFormat("dd MMMM yyyy", 'ru').format(this);
    return dateFormat;
  }

  String get formatColumnDate {
    String dateFormat = DateFormat("dd.MM\nyyyy", 'ru').format(this);
    return dateFormat;
  }

  String get formatNumberDate {
    String dateFormat = DateFormat("dd.MM.yyyy", 'ru').format(this);
    return dateFormat;
  }

  String get formatShortDate {
    String dateFormat = DateFormat("dd.MM", 'ru').format(this);
    return dateFormat;
  }

  String get formatDateNameDay {
    String dateFormat = DateFormat("EEEE, dd MMMM", 'ru').format(this);
    return dateFormat;
  }

  String get getMonth {
    String dateFormat = DateFormat("MMMM", 'ru').format(this);
    return dateFormat;
  }

  String get formatDateNumber {
    String dateFormat = DateFormat("dd.MM.yyyy").format(this);
    return dateFormat;
  }

  String get sendFormat =>
      '$year.${month.toString().padLeft(2, '0')}.${day.toString().padLeft(2, '0')}';

  String get getTime {
    String dateFormat = DateFormat("HH:mm", 'ru_RU').format(this);
    return dateFormat;
  }

  String get getTimer {
    String dateFormat = DateFormat("HH:mm:ss", 'ru_RU').format(this);
    return dateFormat;
  }

  String get sendDate {
    String dateFormat = DateFormat("dd.MM.yyyy").format(this);
    return dateFormat;
  }

  DateTime timeToDate(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

extension DateTimeExtension on String {
  DateTime get formatDateToDate {
    DateFormat dateFormat = DateFormat("dd.MM.yyyy");
    DateTime date = dateFormat.parse(this);
    return date;
  }

  DateTime get formatDate2 {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    return dateFormat.parse(this);
  }

  DateTime get formatTimeDate {
    DateFormat dateFormat = DateFormat("HH:mm dd.MM.yyyy");
    return dateFormat.parse(this);
  }
}

extension ListExtension<T> on List<T> {
  List<T> separateBy<S extends T>(S separator) {
    final separatedListLength = 2 * length - 1;
    final separatedList =
    List<T?>.filled(separatedListLength, null, growable: true);
    for (var i = 0; i < separatedListLength; i++) {
      final int itemIndex = i ~/ 2;
      if (i.isEven) {
        separatedList[i] = this[itemIndex];
      } else {
        separatedList[i] = separator;
      }
    }
    return separatedList.cast<T>();
  }

  List<T> separateAndWrapBy<S extends T>(S separator) {
    final separated = separateBy(separator);
    return separated.wrapBy(separator);
  }

  List<T> wrapBy<S extends T>(S separator) {
    return [
      separator,
      ...this,
      separator,
    ];
  }
}

String getWeekDayShortLabel(int day) => switch (day) {
  7 => 'Вс',
  1 => 'Пн',
  2 => 'Вт',
  3 => 'Ср',
  4 => 'Чт',
  5 => 'Пт',
  6 => 'Сб',
  _ => 'Day not found',
};
