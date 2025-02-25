import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Google Maps API key
    GMSServices.provideAPIKey("")
    /* Añadir API Key         ^         */
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
