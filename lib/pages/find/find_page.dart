import 'package:flutter/material.dart';
import 'package:flutter_wechat/widgets/appbar/nav_bar.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(
        title: '发现',
      ),
      body: const Text('发现'),
    );
  }
}
