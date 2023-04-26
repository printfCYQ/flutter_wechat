import 'package:flutter/material.dart';

class WechatPage extends StatefulWidget {
  const WechatPage({super.key});

  @override
  State<WechatPage> createState() => _WechatPageState();
}

class _WechatPageState extends State<WechatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('微信'),
      ),
    );
  }
}
