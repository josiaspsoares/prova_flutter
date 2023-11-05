import 'package:flutter/material.dart';

import 'pages/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff2a8f8b),
        ),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
