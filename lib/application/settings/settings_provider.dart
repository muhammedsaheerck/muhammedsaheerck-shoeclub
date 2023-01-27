import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsProvider extends ChangeNotifier {
  var loadingPercentage = 0;
  // WebViewController? controller;

  void init(WebViewController webViewController, String url) {
    webViewController
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          loadingPercentage = 0;
          notifyListeners();
        },
        onProgress: (progress) {
          loadingPercentage = progress;
          notifyListeners();
        },
        onPageFinished: (url) {
          loadingPercentage = 100;
          notifyListeners();
        },
      ))
      ..loadRequest(
        Uri.parse(url),
      );
  }
}
