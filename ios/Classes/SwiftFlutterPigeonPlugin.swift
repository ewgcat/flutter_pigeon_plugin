import Flutter
import UIKit

/// 遵循HostEverything协议，实现Flutter调原生的方法
public class SwiftFlutterPigeonPlugin: NSObject, FlutterPlugin, FLTHostEverything {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: FLTHostEverything & NSObjectProtocol = SwiftFlutterPigeonPlugin.init()
        FLTHostEverythingSetup(messenger, api)
    }
    
    // MARK: HostEverything

    public func giveMeEverythingWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTEverything? {
        let everything = FLTEverything()
        everything.aString = "原生返给Flutter的字符串"
        everything.aBool = false
        everything.anInt = 11
        return everything
    }

    /// 遵循HostEverything协议，实现Flutter调原生的方法
    public func echo(_ everything: FLTEverything, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FLTEverything? {
        everything.aString = "原生交换的给Flutter的字符串"
        everything.aBool = false
        everything.anInt = 12
        return everything
    }
}
