import 'package:family_budget/app/di/di.dart';
import 'package:family_budget/data/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'app.dart';

void main() async {
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  // Настройка часовых поясов
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Europe/Moscow'));

  final notifyService = NotificationService();
  await notifyService.initNotifications();
  await initDependencies(Environment.dev);
  await notifyService.setupDefaultReminders();
  await notifyService.setupRecurringReminders();
  runApp(const App());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
