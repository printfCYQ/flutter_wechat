import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/main_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent, // 取消按钮点击颜色效果1
        highlightColor: Colors.transparent, // 取消按钮点击颜色效果2
        hoverColor: Colors.transparent, // 取消按钮点击颜色效果3
      ),
      home: const MainPage(),
      navigatorKey: navigatorKey,
    );
  }
}
