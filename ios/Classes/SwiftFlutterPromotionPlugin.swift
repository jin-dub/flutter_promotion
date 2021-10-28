import Flutter
import UIKit

public class SwiftFlutterPromotionPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_promotion", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterPromotionPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "promotion":
            if let myArgs = call.arguments as? [String: Any],
               let prefer = myArgs["prefer"] as? Float,
               let max = myArgs["max"] as? Float{
                
                if #available(iOS 15.0, *) {
                    let displayLink = CADisplayLink(target: self, selector: #selector(step))
                    displayLink.preferredFrameRateRange = CAFrameRateRange(minimum:60, maximum:max, preferred:prefer)
                    displayLink.add(to: .current, forMode: .default)
                }
                result("called promotion \(prefer), \(max)")
            }else{
                result(FlutterMethodNotImplemented)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    @objc func step(displaylink: CADisplayLink) {
        // Will be called once a frame has been built while matching desired frame rate
    }
}
