import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }


  var systemBrightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

}