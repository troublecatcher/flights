import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum NativePickerMode { time, date, dateAndTime }

class NativePicker extends StatefulWidget {
  const NativePicker({
    Key? key,
    required this.mode,
    required this.initDate,
    required this.onChanged,
    this.tintColor,
    this.minDate,
    this.maxDate,
  }) : super(key: key);

  final NativePickerMode mode;
  final DateTime initDate;
  final void Function(DateTime) onChanged;
  final DateTime? maxDate;
  final DateTime? minDate;
  final Color? tintColor;

  @override
  State<NativePicker> createState() => _NativePickerState();
}

class _NativePickerState extends State<NativePicker> {
  MethodChannel? _channel;

  @override
  Widget build(BuildContext context) {
    const String viewType = 'FLDatePicker';
    Map<String, dynamic> creationParams = <String, dynamic>{
      "mode": widget.mode.index,
    };

    creationParams["initialDate"] = widget.initDate.toIso8601String();
    if (widget.minDate != null) {
      creationParams["minimumDate"] = widget.minDate?.toIso8601String();
    }
    if (widget.maxDate != null) {
      creationParams["maximumDate"] = widget.maxDate?.toIso8601String();
    }
    if (widget.tintColor != null) {
      creationParams["tintColor"] =
          '${widget.tintColor!.red} ${widget.tintColor!.green} ${widget.tintColor!.blue}';
    }

    if (_channel != null) {
      _channel?.invokeMethod('setDate', widget.initDate.toIso8601String());
      _channel?.invokeMethod('setMinDate', widget.minDate?.toIso8601String());
    }
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
      onPlatformViewCreated: (int id) {
        _channel = MethodChannel('FLDatePicker/$id');
        _channel?.setMethodCallHandler(_channelCallHandler);
      },
    );
  }

  Future<void> _channelCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'onChanged':
        String text = call.arguments as String;
        DateTime date = DateTime.parse(text);
        widget.onChanged(date);
    }
  }
}
