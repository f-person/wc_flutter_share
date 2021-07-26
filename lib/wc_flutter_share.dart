import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class WcFlutterShare {
  static const MethodChannel _channel = const MethodChannel('wc_flutter_share');

  /// Share a text, subject and file with other apps.
  static Future<void> share({
    @required String sharePopupTitle,
    String text,
    String subject,
    String filePath,
    @required String mimeType,
    IPadConfig iPadConfig,
  }) async {
    assert(sharePopupTitle != null);
    assert(mimeType != null);

    Map argsMap = <String, dynamic>{
      'sharePopupTitle': sharePopupTitle,
      'text': text,
      'subject': subject,
      'filePath': filePath,
      'mimeType': mimeType,
      'originX': iPadConfig?.originX ?? 0,
      'originY': iPadConfig?.originY ?? 0,
      'originWidth': iPadConfig?.originWidth ?? 0,
      'originHeight': iPadConfig?.originHeight ?? 0,
    };

    _channel.invokeMethod('share', argsMap);
  }
}

class IPadConfig {
  final int originX;
  final int originY;
  final int originWidth;
  final int originHeight;

  IPadConfig({
    this.originX,
    this.originY,
    this.originWidth,
    this.originHeight,
  });
}
