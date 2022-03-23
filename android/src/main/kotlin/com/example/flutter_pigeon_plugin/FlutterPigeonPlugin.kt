package com.example.flutter_pigeon_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterPigeonPlugin */
class FlutterPigeonPlugin: FlutterPlugin, MethodCallHandler, AllTypesPigeon.HostEverything {

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    AllTypesPigeon.HostEverything.setup(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    result.notImplemented()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    AllTypesPigeon.HostEverything.setup(binding.binaryMessenger, null)
  }

  override fun giveMeEverything(): AllTypesPigeon.Everything {
    var everything: AllTypesPigeon.Everything = AllTypesPigeon.Everything()
    everything.aString = "原生返给Flutter的字符串"
    everything.aBool = false
    everything.anInt = 11
    return everything
  }

  override fun echo(everything: AllTypesPigeon.Everything?): AllTypesPigeon.Everything? {
    everything?.aString = "原生交换的给Flutter的字符串"
    everything?.aBool = false
    everything?.anInt = 12
    return everything
  }
}
