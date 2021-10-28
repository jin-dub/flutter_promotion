import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPromotion {
  static const MethodChannel _channel = MethodChannel('flutter_promotion');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<String?> setPromotion({double? max = 60, double? prefer = 60}) async {
    final String? version = await _channel.invokeMethod('promotion', <String, dynamic>{
      'prefer': max,
      'max': prefer,
    });
    return version;
  }
}
