import 'package:flutter/material.dart';
import 'package:flutter_wechat/widgets/appbar/nav_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar( title: '通讯录',),
      body: const Text('通讯录'),
    );
  }
}
