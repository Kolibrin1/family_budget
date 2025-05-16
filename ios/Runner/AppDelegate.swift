import UIKit
import Flutter
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Настройка для iOS 10 и выше
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
    }

    // Настройка уведомлений
    configureLocalNotifications()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Метод для настройки уведомлений
  private func configureLocalNotifications() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
      if let error = error {
        print("Ошибка при запросе разрешений на уведомления: \(error.localizedDescription)")
      }
      if granted {
        print("Разрешение на уведомления получено.")
      } else {
        print("Разрешение на уведомления отклонено.")
      }
    }
  }
}