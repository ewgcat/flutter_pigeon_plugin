import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pigeon_plugin/all_types_pigeon.dart';
import 'package:flutter_pigeon_plugin/flutter_pigeon_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> getHostData() async {
    /// 通过插件调用原生方法
    Everything everything = await FlutterPigeonPlugin.getEverything();
    debugPrint('everything.aString: ${everything.aString}');
    debugPrint('everything.aBool: ${everything.aBool}');
    debugPrint('everything.anInt：${everything.anInt}');
  }

  void echoHostData() async {
    Everything echoEveryThing = Everything();
    echoEveryThing.aString = '我要跟原生交换的字符串';
    echoEveryThing.aBool = true;
    echoEveryThing.anInt = 10;

    /// 通过插件调用原生方法
    Everything everything = await FlutterPigeonPlugin.echoEveryThing(echoEveryThing);
    debugPrint('everything.aString: ${everything.aString}');
    debugPrint('everything.aBool: ${everything.aBool}');
    debugPrint('everything.anInt：${everything.anInt}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            MaterialButton(
              onPressed: getHostData,
              child: const Text('获取原生的数据'),
            ),
            MaterialButton(
              onPressed: echoHostData,
              child: const Text('与原生交换数据'),
            ),
          ],
        ),
      ),
    );
  }
}
