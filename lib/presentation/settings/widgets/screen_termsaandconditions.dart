import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../application/settings/settings_provider.dart';

class ScreenTermsAndConditions extends StatelessWidget {
  ScreenTermsAndConditions({super.key});
  final WebViewController controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    Provider.of<SettingsProvider>(context, listen: false).init(controller,
        'https://www.app-privacy-policy.com/live.php?token=pvCgrEWPB2rHfI37Lyfv2m6EgUfDsMFG');
    final webViewModel = Provider.of<SettingsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Terms and Conditions")),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (webViewModel.loadingPercentage < 100)
            LinearProgressIndicator(
              value: webViewModel.loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
