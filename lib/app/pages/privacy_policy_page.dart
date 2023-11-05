import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyPage extends StatelessWidget {
  PrivacyPolicyPage({super.key});

  final controller = WebViewController()
    ..loadRequest(
      Uri.parse('https://www.google.com.br'),
    )
    ..setBackgroundColor(Colors.white);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
