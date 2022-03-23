import 'dart:async';

import 'package:flutter_pigeon_plugin/all_types_pigeon.dart';

class FlutterPigeonPlugin {
  static final HostEverything _hostEverything = HostEverything();

  /// Flutter 调用原生方法
  static Future<Everything> getEverything() async {
    return await _hostEverything.giveMeEverything();
  }

  /// Flutter 调用原生方法
  static Future<Everything> echoEveryThing(Everything everything) async {
    return await _hostEverything.echo(everything);
  }
}
