import 'package:flutter/material.dart';
import 'package:flutter_wechat/main.dart';

class CloseBar extends AppBar {
  CloseBar({super.key})
      : super(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          elevation: 0, // 阴影
          leading: InkWell(
            splashColor: Colors.transparent, // 取消按钮点击颜色效果1
            highlightColor: Colors.transparent, // 取消按钮点击颜色效果2
            hoverColor: Colors.transparent, // 取消按钮点击颜色效果3
            onTap: () => Navigator.of(navigatorKey.currentState!.context).pop(),
            child: UnconstrainedBox(
              child: Image.asset(
                'assets/images/login_close.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        );
}
