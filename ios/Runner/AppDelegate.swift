import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    GeneratedPluginRegistrant.register(with: self)
    weak var registrar = self.registrar(forPlugin: "plugin-name")
    let factory = FLDatePickerFactory(messenger: registrar!.messenger())
    self.registrar(forPlugin: "<plugin-name>")!.register(
     factory,
     withId: "FLDatePicker"
    )
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
