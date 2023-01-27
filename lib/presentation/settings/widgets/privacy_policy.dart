import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shoeclub/application/settings/settings_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: WebViewStack(),
    ));
  }
}

class WebViewStack extends StatelessWidget {
  WebViewStack({super.key});
  final WebViewController controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    Provider.of<SettingsProvider>(context, listen: false).init(controller,
        'https://www.freeprivacypolicy.com/live/8ad3b32c-a7bd-49c3-afd6-e5445e58f403');
    final webViewModel = Provider.of<SettingsProvider>(context, listen: false);
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (webViewModel.loadingPercentage < 100)
          LinearProgressIndicator(
            value: webViewModel.loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
