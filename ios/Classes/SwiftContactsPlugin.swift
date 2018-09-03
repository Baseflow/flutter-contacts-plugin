import Flutter
import UIKit
    
public class SwiftContactsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter.baseflow.com/contacts_plugin/methods", binaryMessenger: registrar.messenger())
    let instance = SwiftContactsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getContacts" {
        ContactManager.fetchContacts(result: result)
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}
