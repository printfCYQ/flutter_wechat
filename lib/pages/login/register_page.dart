import 'package:flutter/material.dart';

import '../../widgets/appbar/close_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloseBar(),
      body: const Center(
        child: Text('无需注册，直接用手机号登录'),
      ),
    );
  }
}
