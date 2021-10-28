
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPromotion {
  static const MethodChannel _channel = MethodChannel('flutter_promotion');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
