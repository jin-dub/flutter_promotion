import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FlutterPromotion {
  static const MethodChannel _channel = MethodChannel('flutter_promotion');

  Future<bool?> setPromotion({double? max = 60, double? prefer = 60}) async {
    if (Platform.isIOS) {
      return await _channel.invokeMethod('set_promotion', <String, dynamic>{
        'prefer': max,
        'max': prefer,
      });
    } else {
      return false;
    }
  }
}
