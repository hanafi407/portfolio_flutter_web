import 'package:flutter/material.dart';
import 'package:porfolio_flutter_web/views/home_page.dart';
import 'package:porfolio_flutter_web/views/main_dashboard.dart';
import 'package:porfolio_flutter_web/views/tesx.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MainDashboard(),
    );
  }
}
