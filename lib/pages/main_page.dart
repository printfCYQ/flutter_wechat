// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  void action(String value) {
    if (value == '0') {
      print('登陆');
    } else {
      print('注册');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double rateWidth = (MediaQuery.of(context).size.width - 60) / 2;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              children: ['登录', '注册'].map((e) {
                final String valueStr = e == '登录' ? '0' : '1';
                return InkWell(
                  child: Container(
                    margin: valueStr == '0'
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.only(right: 20),
                    alignment: Alignment.center,
                    width: rateWidth,
                    height: rateWidth * 49 / 158,
                    decoration: BoxDecoration(
                      color: valueStr == '0'
                          ? Colors.white.withOpacity(0.12)
                          : const Color(0xff07c160),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  onTap: () => action(valueStr),
                );
              }).toList(),
              //   children: [
              //     InkWell(
              //       child: Container(
              //         margin: const EdgeInsets.symmetric(horizontal: 20),
              //         alignment: Alignment.center,
              //         width: rateWidth,
              //         height: rateWidth * 49 / 158,
              //         decoration: BoxDecoration(
              //           color: Colors.white.withOpacity(0.12),
              //           borderRadius: const BorderRadius.all(Radius.circular(9)),
              //         ),
              //         child: const Text(
              //           '登陆',
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.white,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //       onTap: () => action('0'),
              //     ),
              //     InkWell(
              //       child: Container(
              //         alignment: Alignment.center,
              //         width: rateWidth,
              //         height: rateWidth * 49 / 158,
              //         decoration: const BoxDecoration(
              //           color: Color(0xff07c160),
              //           borderRadius: BorderRadius.all(Radius.circular(9)),
              //         ),
              //         child: const Text(
              //           '注册',
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.white,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //       onTap: () => action('1'),
              //     )
              //   ],
            ),
          ]),
        ),
      ),
    );
  }
}
