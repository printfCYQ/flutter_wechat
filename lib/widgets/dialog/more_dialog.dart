import 'package:flutter/material.dart';

OverlayEntry? entry;

void moreDialog(BuildContext context) {
  // 获取传进来的上下文信息
  RenderBox renderBox = context.findRenderObject() as RenderBox;
  Offset offset = renderBox.localToGlobal(Offset.zero);
  entry = OverlayEntry(
    builder: (context) {
      return Material(
        type: MaterialType.transparency,
        child: MoreDialog(
          dy: offset.dy,
          dismissHandle: () {
            entry!.remove();
          },
        ),
      );
    },
  );
  Overlay.of(context).insert(entry!);
}

class MoreDialog extends StatefulWidget {
  final VoidCallback dismissHandle;
  final double dy;
  const MoreDialog({super.key, required this.dismissHandle, required this.dy});

  @override
  State<MoreDialog> createState() => _MoreDialogState();
}

class _MoreDialogState extends State<MoreDialog> {
  @override
  Widget build(BuildContext context) {
    const double itemHeight = 53;

    List<List<String>> items = [
      ['msg_more_lauch_group', '发起聊天'],
      ['msg_more_add_friend', '添加朋友'],
      ['msg_more_scan', '扫一扫'],
    ];
    return InkWell(
      onTap: () {
        entry!.remove();
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 134,
          height: itemHeight * 3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Color(0xff4c4c4c),
          ),
          margin: EdgeInsets.only(
            top: widget.dy + kTextTabBarHeight,
            right: 7,
          ),
          child: Column(
            children: items.map(
              (e) {
                return SizedBox(
                  height: itemHeight,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 14,
                      ),
                      Image.asset(
                        'assets/images/msg/${e[0]}.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: itemHeight - 1,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: e[1] == items.last[1]
                                    ? Colors.transparent
                                    : const Color(0xff535353),
                              ),
                            ),
                          ),
                          child: Text(
                            e[1],
                            style: const TextStyle(
                              color: Color(0xffcfcfcf),
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
