import 'package:flutter/material.dart';

import '../dialog/more_dialog.dart';

class NavBar extends AppBar {
  NavBar({super.key,required String title})
      : super(
          backgroundColor: const Color(0xffEDEDED),
          elevation: 0,
          title:  Text(
            title,
            style: const TextStyle(
              color: Color(0xff181818),
              fontSize: 16,
            ),
          ),
          actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque, // 空白区域也可以点击
                  onTap: () {
                    moreDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Image.asset(
                      'assets/images/msg/msg_more.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
