import 'package:flutter/material.dart';
import 'package:flutter_wechat/widgets/appbar/nav_bar.dart';

class WechatPage extends StatefulWidget {
  const WechatPage({super.key});

  @override
  State<WechatPage> createState() => _WechatPageState();
}

class _WechatPageState extends State<WechatPage> {
  List<String> mockData = ['特朗普', '拜登'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar( title: '微信',),
      body: Column(
        children: [
         Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 13,
                            bottom: 12,
                            left: 16,
                            right: 11,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: Image.network(
                              'https://p3-passport.byteimg.com/img/user-avatar/8b29c46c806762d72e9cb19a43b490dd~64x64.awebp',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 11 / 2,
                          top: 13 / 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xfffa5151),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            child: const Text(
                              '1',
                              style: TextStyle(
                                color: Color(0xffcfcfcf),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        height: 72,
                        padding: const EdgeInsets.only(top: 13),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffe5e5e5),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    mockData[index],
                                    style: const TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Text(
                                  '昨天 10:53',
                                  style: TextStyle(
                                    color: Color(0xffcdcdcd),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 16),
                              ],
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              '日光照射',
                              style: TextStyle(
                                color: Color(0xffb3b3b3),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: mockData.length,
            ),
          ),
        ],
      ),
    );
  }
}


// Container(
//   color: const Color(0xffEDEDED),
//   width: double.infinity,
//   height: 50,
//   padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
//   child: Container(
//     decoration: const BoxDecoration(
//       color: Color(0xffffffff),
//       borderRadius: BorderRadius.all(
//         Radius.circular(9),
//       ),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           'assets/images/msg/msg_search.png',
//           width: 25,
//           height: 25,
//         ),
//         const SizedBox(width: 7),
//         const Text(
//           '搜索',
//           style: TextStyle(
//             color: Color(0xffB3B3B3),
//             fontSize: 16,
//           ),
//         )
//       ],
//     ),
//   ),
// ),
          