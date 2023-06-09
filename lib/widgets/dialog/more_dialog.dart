import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/more/add_friend_page.dart';

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

    void action(String value) {
      switch (value) {
        case '发起聊天':
          print('发起聊天');
          entry!.remove();
          break;
        case '添加朋友':
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AddFriendPage();
          }));
          entry!.remove();
          break;
        case '扫一扫':
          print('扫一扫');
          entry!.remove();
          break;
        default:
          break;
      }
    }

    return InkWell(
      onTap: () {
        entry!.remove();
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: widget.dy + kTextTabBarHeight,
            ),
            Container(
              height: 10,
              width: 20,
              margin: const EdgeInsets.only(right: 23),
              child: CustomPaint(
                painter: MoreTopPainter(),
              ),
            ),
            Container(
              width: 134,
              height: itemHeight * items.length,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Color(0xff4c4c4c),
              ),
              margin: const EdgeInsets.only(right: 7),
              child: Column(
                children: items.map(
                  (e) {
                    return InkWell(
                      onTap: () => action(e[1]),
                      child: SizedBox(
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
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreTopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xff4c4c4c)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo((size.width / 2) - 1, 0);
    path.lineTo((size.width / 2) + 1, 0);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
