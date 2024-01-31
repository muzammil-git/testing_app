import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectivityManager {
  static ConnectivityManager? _instance;
  late final Stream<ConnectivityResult> connectivityStream;

  ValueNotifier<bool> isConnected = ValueNotifier<bool>(false);

  ConnectivityManager._() {
    try {
      connectivityStream = Connectivity().onConnectivityChanged;
      connectivityStream.listen((ConnectivityResult connectivityResult) {
        // Check if the device is connected to the internet.
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          // The device is connected to the internet.
          print('Connected to the internet');
          isConnected.value = true;
        } else {
          // The device is not connected to the internet.
          print('Not connected to the internet');
          isConnected.value = false;
        }
      });
    } catch (e) {
      print("Error in Connectivity Manager: $e");
    }
  }

  factory ConnectivityManager() {
    if (_instance == null) {
      _instance = ConnectivityManager._();
      print("Creating new instance : Connectivity Manager");
    }
    return _instance!;
  }

  void dispose(){
    _instance = null;
    print("Disposing : Connectivity Manager");
  }

}