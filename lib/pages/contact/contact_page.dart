import 'package:flutter/material.dart';
import 'package:flutter_wechat/widgets/appbar/nav_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<List<String>> defItems = [
    ['assets/images/contact/contact_add_friend.png', '新的朋友'],
    ['assets/images/contact/contact_only_chat.png', '仅聊天的朋友']
  ];

  List<List<String>> userList = [
    [
      'https://img0.baidu.com/it/u=14318598,2695394059&fm=253&fmt=auto&app=120&f=JPEG?w=1069&h=800',
      '贾元春',
      'J'
    ],
    [
      'https://img1.baidu.com/it/u=3269210858,2158602120&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=667',
      '贾迎春',
      ''
    ],
    [
      'https://img1.baidu.com/it/u=3407626608,3515383313&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=387',
      '贾探春',
      ''
    ],
    [
      'https://img2.baidu.com/it/u=3928558113,4212538489&fm=253&fmt=auto&app=138&f=JPEG?w=646&h=500',
      '贾惜春',
      ''
    ],
    [
      'https://img1.baidu.com/it/u=1270348255,3011092598&fm=253&fmt=auto&app=120&f=JPEG?w=906&h=500',
      '贾巧姐',
      ''
    ],
    [
      'https://img1.baidu.com/it/u=4172239231,4235836534&fm=253&fmt=auto&app=138&f=JPEG?w=372&h=500',
      '秦可卿',
      'Q'
    ],
    [
      'https://p3-passport.byteimg.com/img/user-avatar/8b29c46c806762d72e9cb19a43b490dd~64x64.awebp',
      '林黛玉',
      'L'
    ],
    [
      'https://img2.baidu.com/it/u=3563004313,1461371133&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=664',
      '李纨',
      ''
    ],
    [
      'https://img0.baidu.com/it/u=4009618267,3947388980&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=616',
      '妙玉',
      'M'
    ],
    [
      'https://img2.baidu.com/it/u=303537843,1999106657&fm=253&fmt=auto&app=120&f=JPEG?w=1067&h=800',
      '史湘云',
      'S'
    ],
    [
      'https://img2.baidu.com/it/u=276149716,3215610863&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=1070',
      '王熙凤',
      'W'
    ],
    [
      'https://img0.baidu.com/it/u=749929512,1647130700&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=1121',
      '薛宝钗',
      'X'
    ],
  ];

  List<String> indexBar = ["", "J", "Q", "L", "M", "S", "W", "X", "#"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(
        title: '通讯录',
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ...defItems.map(
                      (e) {
                        bool needBorder = e != defItems.last;
                        return ContactItemDef(
                          item: e,
                          needBorder: needBorder,
                        );
                      },
                    ).toList(),
                    ...userList.map(
                      (e) {
                        final int currentIndex = userList.indexOf(e);
                        return ContactItemUser(
                          item: e,
                          currentIndex: currentIndex,
                          items: userList,
                        );
                      },
                    ).toList()
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indexBar.map(
                (e) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    child: e == ''
                        ? Image.asset(
                            'assets/images/msg/msg_search.png',
                            width: 9,
                            color: const Color(0xff555555),
                          )
                        : Text(
                            e,
                            style: const TextStyle(
                              color: Color(0xff555555),
                              fontSize: 9,
                            ),
                          ),
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ContactItemDef extends StatelessWidget {
  final bool needBorder;
  final List<String> item;
  const ContactItemDef({
    super.key,
    this.needBorder = false,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xfff79d40),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(
            left: 16,
            right: 13,
            top: 9,
            bottom: 4,
          ),
          child: Image.asset(
            item[0],
            width: 25,
            height: 25,
          ),
        ),
        Expanded(
          child: Container(
            height: 53,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:
                      needBorder ? const Color(0xffE5e5e5) : Colors.transparent,
                ),
              ),
            ),
            child: Text(
              item[1],
              style: const TextStyle(
                color: Color(0xff181818),
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ContactItemUser extends StatelessWidget {
  final bool needBorder;
  final int currentIndex;
  final List<String> item;
  final List<List<String>> items;

  const ContactItemUser({
    super.key,
    this.needBorder = false,
    required this.item,
    required this.items,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    bool needTitle = item[2] != '';
    final int nextIndex = currentIndex + 1;
    bool needBorder =
        currentIndex < items.length - 1 && items[nextIndex][2] == '';
    return Column(
      children: [
        if (needTitle)
          Container(
            color: const Color(0xffededed),
            padding: const EdgeInsets.only(left: 6),
            margin: const EdgeInsets.only(top: 5),
            height: 32,
            alignment: Alignment.centerLeft,
            child: Text(
              item[2],
              style: const TextStyle(
                color: Color(0xff6b6b6b),
                fontSize: 14,
              ),
            ),
          ),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xfff79d40),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              margin: const EdgeInsets.only(
                left: 16,
                right: 13,
                top: 9,
                bottom: 4,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.network(
                  item[0],
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 53,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: needBorder
                          ? const Color(0xffE5e5e5)
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  item[1],
                  style: const TextStyle(
                    color: Color(0xff181818),
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
