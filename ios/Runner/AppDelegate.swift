import Flutter
import UIKit
import GoogleMaps
import flutter_dotenv

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Google Maps API key
    DotEnv().load();
    GMSServices.provideAPIKey(DotEnv.env['GOOGLE_API_KEY']??"")
    /* Añadir API Key         ^         */
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
