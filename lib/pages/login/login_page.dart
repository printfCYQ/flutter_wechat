// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class DividingLine extends StatelessWidget {
  const DividingLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0xffD8D8D8),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();

  void login() {
    if (controller.text == '') {
      Fluttertoast.showToast(msg: '请输入手机号', gravity: ToastGravity.CENTER);
      return;
    }
    RegExp exp = RegExp(
        r'^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$');
    if (!exp.hasMatch(controller.text)) {
      Fluttertoast.showToast(msg: '手机号码不正确', gravity: ToastGravity.CENTER);
      return;
    }
    Fluttertoast.showToast(msg: '校验通过', gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = const TextStyle(
      color: Color(0xff1a1a1a),
      fontSize: 16,
    );

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, // 键盘唤醒不顶起页面
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0, // 阴影
          leading: InkWell(
            splashColor: Colors.transparent, // 取消按钮点击颜色效果1
            highlightColor: Colors.transparent, // 取消按钮点击颜色效果2
            hoverColor: Colors.transparent, // 取消按钮点击颜色效果3
            onTap: () => Navigator.of(context).pop(),
            child: UnconstrainedBox(
              child: Image.asset(
                'assets/images/login_close.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            // 输入框失去焦点，键盘收起
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(32),
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 69 - 18),
                        const Center(
                          child: Text(
                            '手机号登陆',
                            style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 47),
                        const DividingLine(),
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            SizedBox(
                              width: 72 + 35,
                              child: Text(
                                '国家/地区',
                                style: labelStyle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '中国大陆',
                                style: labelStyle,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 17),
                        const DividingLine(),
                        SizedBox(
                          height: 23 + 16 + 18,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 72 + 35,
                                child: Text(
                                  '手机号',
                                  style: labelStyle,
                                ),
                              ),
                              const Text(
                                '+86',
                                style: TextStyle(
                                    color: Color(0xff737373), fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: controller,
                                  keyboardType: TextInputType.number, // 键盘类型
                                  cursorColor: const Color(0xff07Ca60),
                                  cursorWidth: 2,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(
                                        11), // 最多11位
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]')) // 是能粘贴进数字
                                  ],
                                  onChanged: (value) {
                                    setState(() {}); // 暂时全局更新页面
                                  },
                                  decoration: const InputDecoration(
                                    hintText: '请输入手机号',
                                    hintStyle: TextStyle(
                                      color: Color(0xffB3B3B3),
                                      fontSize: 16,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              if (controller.text != '')
                                IconButton(
                                  onPressed: () {
                                    controller.clear();
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  icon: Image.asset(
                                    'assets/images/login_input_delete.png',
                                    width: 17,
                                    height: 17,
                                  ),
                                )
                            ],
                          ),
                        ),
                        const DividingLine(),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                '上述手机号仅用于登录验证',
                style: TextStyle(
                  color: Color(0xffB3B3B3),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 22),
              InkWell(
                child: Container(
                  width: 184,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xff07C160),
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '同意并继续',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () => login(),
              ),
              const SizedBox(height: 101),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ));
  }
}
