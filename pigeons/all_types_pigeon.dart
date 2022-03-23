import 'package:pigeon/pigeon.dart';

class Everything {
  bool? aBool;
  int? anInt;
  double? aDouble;
  String? aString;
  Uint8List? aByteArray;
  Int32List? a4ByteArray;
  Int64List? a8ByteArray;
  Float64List? aFloatArray;
  // ignore: always_specify_types
  List? aList;
  // ignore: always_specify_types
  Map? aMap;
  List<List<bool?>?>? nestedList;
  Map<String?, String?>? mapWithAnnotations;
}

/// Flutter调用原生的方法
@HostApi()
abstract class HostEverything {
  Everything giveMeEverything();
  Everything echo(Everything everything);
}

/// 原生调用Flutter的方法
@FlutterApi()
abstract class FlutterEverything {
  Everything giveMeEverythingFlutter();
  Everything echoFlutter(Everything everything);
}
