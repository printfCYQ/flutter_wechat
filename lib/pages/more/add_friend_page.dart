import 'package:flutter/material.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  bool searching = false; // 是否在搜索

  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List mockData = [
    [Icons.radar, '雷达加朋友', '添加身边的朋友', 0xff6767ef],
    [Icons.group, '面对面建群', '与身边的朋友进入同一个群聊', 0xff03c161],
    [Icons.qr_code_scanner_rounded, '扫一扫', '扫描二维码名片', 0xff1486ef],
    [Icons.person_add_alt_1_rounded, '手机联系人', '添加或邀请通讯录中的朋友', 0xfffa9f3c],
    [Icons.person_pin_rounded, '公众号', '获取更多咨询和服务', 0xff2881d8],
    [Icons.wechat_rounded, '企业微信联系人', '通过手机号搜索企业微信用户', 0xff2881d6],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      appBar: searching
          ? null
          : AppBar(
              backgroundColor: const Color(0xffededed),
              elevation: 0,
              leading: InkWell(
                child: const Center(
                  child: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: Color(0xff181818),
                    size: 34,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              title: const Text(
                "添加朋友",
                style: TextStyle(
                  color: Color(0xff181818),
                  fontSize: 16,
                ),
              ),
            ),
      body: searching
          ? SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.only(left: 11),
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_rounded,
                            color: Color(0xffb3b3b3),
                            size: 20,
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              focusNode: focusNode,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                hintText: '账号/手机号',
                                hintStyle: TextStyle(
                                  color: Color(0xffb3b3b3),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      searching = false;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 55,
                      height: 36,
                      child: const Text(
                        "取消",
                        style: TextStyle(
                          color: Color(0xff7d90a9),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : ListView(
              children: [
                InkWell(
                  onTap: () {
                    searching = true;
                    focusNode.requestFocus(); // 获取焦点
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 17,
                      top: 6,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.search_rounded,
                          size: 22,
                          color: Color(0xffb3b3b3),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '账号/手机号',
                          style: TextStyle(
                            color: Color(0xffb3b3b3),
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '我的微信号：YQ459987870',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(156, 120, 120, 120),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 25,
                        color: Color.fromARGB(156, 120, 120, 120),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: mockData.map((e) {
                      return Row(
                        children: [
                          // 左侧图片区域
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color(e[3]),
                            ),
                            margin: const EdgeInsets.only(
                              top: 13,
                              bottom: 12,
                              left: 16,
                              right: 11,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                e[0],
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                          // 右侧区域
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // 文字区域
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                e[1],
                                                style: const TextStyle(
                                                  color: Color(0xff1a1a1a),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          e[2],
                                          style: const TextStyle(
                                            color: Color(0xffb3b3b3),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // 右侧箭头图标
                                  const Icon(
                                    Icons.chevron_right_sharp,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
    );
  }
}
