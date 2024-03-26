import Flutter
import UIKit

func colorFromString(componentsString: String) -> UIColor? {
    let components = componentsString.components(separatedBy: " ")
    guard components.count == 3,
          let red = Float(components[0]),
          let green = Float(components[1]),
          let blue = Float(components[2]) else {
        return nil // Invalid format
    }
    
    return UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1.0)
}

class FLDatePickerFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLDatePicker(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLDatePicker: NSObject, FlutterPlatformView {
    private var _view: UIDatePicker
    private var channel: FlutterMethodChannel?
    private var backgroundColor: UIColor?
    private var textColor: UIColor?

    static let inDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        return dateFormatter
    }()

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        let argsDict = args as! Dictionary<String, Any>;
        let picker = UIDatePicker(frame: frame)
        
        picker.datePickerMode = UIDatePicker.Mode(rawValue: argsDict["mode"] as! Int)!
        picker.preferredDatePickerStyle = .inline
        picker.date = FLDatePicker.inDateFormatter.date(from: argsDict["initialDate"] as! String) ?? Date()
        
        if let colorString = argsDict["tintColor"] as? String,
           let tintColor = colorFromString(componentsString: colorString) {
            picker.tintColor = tintColor
        }
        if let dateStr = argsDict["minimumDate"] as? String {
            picker.minimumDate = FLDatePicker.inDateFormatter.date(from: dateStr) ?? Date()
        }
        if let dateStr = argsDict["maximumDate"] as? String {
            picker.maximumDate = FLDatePicker.inDateFormatter.date(from: dateStr) ?? Date()
        }
        picker.sizeToFit()
        _view = picker
        channel = FlutterMethodChannel(name: "FLDatePicker/\(viewId)", binaryMessenger: messenger!);
        super.init()
        picker.addTarget(self, action: #selector(onChanged), for: .valueChanged)
        picker.addTarget(self, action: #selector(onEndEdit), for: .editingDidEnd)
        channel?.setMethodCallHandler({ call, reault in
            if call.method == "setDate" {
                if let date = call.arguments as? String {
                    self._view.date = FLDatePicker.inDateFormatter.date(from: date) ?? Date()
                }
            }
            if call.method == "setMinDate" {
                if let dateStr = call.arguments as? String {
                    self._view.minimumDate = FLDatePicker.inDateFormatter.date(from: dateStr) ?? Date()
                }
            }
        })

    }

    @objc func onEndEdit(_ sender: UIDatePicker) {
        /// iOS 17.0 and under
        if textColor != nil, let subviews = sender.subviews.first?.subviews.first?.subviews, subviews.count > 1 {
            let lblView = subviews[1]
            lblView.setValue(textColor, forKey: "textColor");
        }
        /// iOS 17.1 and up
        else if textColor != nil, let subviews = sender.subviews.first?.subviews.first?.subviews.first?.subviews, subviews.count > 1 {
            let lblView = subviews[1]
            lblView.setValue(textColor, forKey: "textColor");
        }
    }
    
    @objc func onChanged(_ sender: UIDatePicker) {
        let dateStr = FLDatePicker.inDateFormatter.string(from: sender.date)
        channel?.invokeMethod("onChanged", arguments: dateStr)
        if backgroundColor != nil, let bgView = sender.subviews.first?.subviews.first?.subviews.first {
            bgView.backgroundColor = backgroundColor
        }
    }

    func view() -> UIView {
        return _view
    }
}
