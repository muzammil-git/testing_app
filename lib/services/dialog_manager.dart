import 'package:flutter/material.dart';

class DialogManager {
  static final DialogManager _instance = DialogManager._internal();

  factory DialogManager() {
    return _instance;
  }

  DialogManager._internal();

  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  OverlayEntry? _loadingOverlayEntry;

  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  GlobalKey<NavigatorState> getNavigatorKey() => _navigatorKey;

  void showLoading() {
    _loadingOverlayEntry = OverlayEntry(
      builder: (context) => LoadingOverlayEntry().buildLoadingOverlay(),
    );
    _navigatorKey.currentState?.overlay?.insert(_loadingOverlayEntry!);
  }

  void hideLoading({int seconds = 1}) {

    Future.delayed( Duration(seconds: seconds), () { // <-- Delay here
      _loadingOverlayEntry?.remove();
    });
  }

  void showSnackBar(String text,){
    ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  showAlertDialog(String title, String content, {Function()? onClickAction}) {

    // Function() onClickAction;

    return showDialog(
      context: _navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(title.toString()),
        content: Text(content.toString()),
        actions: [

          TextButton(
            onPressed: () async {
              onClickAction?.call();
              Navigator.of(context).pop();
            },
            child: const Text("Resend"),
          ),

          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

}

class LoadingOverlayEntry {
  Widget buildLoadingOverlay() {
    return Container(
      color: Colors.black.withAlpha(100),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}