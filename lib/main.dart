import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_shortener/config/config.dart';
import 'package:url_shortener/features/home/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
