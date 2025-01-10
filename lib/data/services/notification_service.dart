import 'package:family_budget/main.dart';
import 'package:flutter/foundation.dart';
import 'package:family_budget/data/models/default_reminder_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  Future<void> initNotifications() async {
    // Настройки для iOS
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: true,
    );
    InitializationSettings initializationSettings = const InitializationSettings(
      android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
    );

    // Запрос разрешений на iOS
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Пример уведомления',
      'Это текст уведомления',
      details,
      payload: 'Тестовый payload',
    );
  }

  Future<void> setupDefaultReminders() async {
    final List<DefaultReminderModel> reminders = [
      DefaultReminderModel(
        id: 1,
        title: 'Проверь свои расходы!',
        description: 'Проверь свои расходы за неделю.',
        date: DateTime.now().add(const Duration(days: 7)),
        isRecurring: true,
      ),
      DefaultReminderModel(
        id: 2,
        title: 'Не забудь про зарплату!',
        description: 'Проверь поступление зарплаты.',
        date: DateTime(DateTime.now().year, DateTime.now().month + 1, 1),
        isRecurring: false,
      ),
    ];

    for (var reminder in reminders) {
      await scheduleDefaultReminder(reminder);
    }
  }

  Future<void> scheduleDefaultReminder(DefaultReminderModel reminder) async {
    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(reminder.date, tz.local);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      reminder.id,
      reminder.title,
      reminder.description,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel',
          'Автоматические напоминания',
          channelDescription: 'Напоминания по умолчанию',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: reminder.isRecurring
          ? DateTimeComponents.dayOfMonthAndTime
          : null,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> setupRecurringReminders() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Проверь баланс!',
      'Не забудь проверить свои доходы и расходы.',
      _nextInstanceOfWeeklyTime(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'recurring_channel',
          'Регулярные напоминания',
          channelDescription: 'Напоминания о проверке баланса',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  tz.TZDateTime _nextInstanceOfWeeklyTime() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, 9); // 9:00 AM

    // Если текущее время после 9:00, добавляем день
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    // Ищем следующий понедельник
    while (scheduledDate.weekday != DateTime.monday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }
}


void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
}