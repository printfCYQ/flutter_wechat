import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/wechat/wechat_page.dart';

import '../contact/contact_page.dart';
import '../find/find_page.dart';
import '../me/me_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class BottomModel {
  final double width;
  final double height;
  final String iconName;
  final String label;

  BottomModel(this.width, this.height, this.iconName, this.label);
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;

  PageController pageController = PageController();

  List<BottomModel> items = [
    BottomModel(25, 25, 'msg', '微信'),
    BottomModel(25, 25, 'contact', '通讯录'),
    BottomModel(25, 25, 'find', '发现'),
    BottomModel(25, 25, 'me', '我'),
  ];

  List<Widget> pages = [
    const WechatPage(),
    const ContactPage(),
    const FindPage(),
    const MePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // 禁止左右滑动切换页面
        controller: pageController,
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
        children: pages,
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xff07c160),
            unselectedItemColor: const Color(0xff1c1c1c),
            selectedFontSize: 10,
            unselectedFontSize: 10,
            backgroundColor: const Color(0xfff9f9f9),
            onTap: (value) {
              currentIndex = value;
              pageController.jumpToPage(currentIndex);
              setState(() {});
            },
            items: items.map((e) {
              BottomModel model = e;
              return BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Image.asset(
                    'assets/images/bar/bottom_${model.iconName}_c.png',
                    width: model.width,
                    height: model.height,
                  ),
                ),
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Image.asset(
                    'assets/images/bar/bottom_${model.iconName}_s.png',
                    width: model.width,
                    height: model.height,
                  ),
                ),
                label: model.label,
              );
            }).toList(),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 4) / 2 + 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: const BoxDecoration(
                color: Color(0xfffa5151),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                '3',
                style: TextStyle(
                  color: Color(0xffcfcfcf),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
