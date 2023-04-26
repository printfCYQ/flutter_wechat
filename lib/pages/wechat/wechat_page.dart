// ignore_for_file: avoid_print

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffEDEDED),
        elevation: 0,
        title: const Text(
          '微信',
          style: TextStyle(
            color: Color(0xff181818),
            fontSize: 16,
          ),
        ),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque, // 空白区域也可以点击
            onTap: () {
              print('more');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Image.asset(
                'assets/images/msg/msg_more.png',
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xffEDEDED),
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.all(
                  Radius.circular(9),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/msg/msg_search.png',
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    '搜索',
                    style: TextStyle(
                      color: Color(0xffB3B3B3),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
