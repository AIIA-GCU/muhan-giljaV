import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:aiia/grade_upload_page/jeongsi_upload_page.dart';
import 'package:aiia/grade_upload_page/susi_upload_page.dart';

import 'package:aiia/config/variables.dart';

import '../main_page/layout.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              color: Color(app_background),
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
                      offset: Offset(-10, 0),
                      child: IconButton(
                        icon: Icon(
                          color: Colors.black,
                          Icons.arrow_back_rounded,
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context, MaterialPageRoute(builder: (context) => HomeLayout()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(widget_background),
                    ),
                    height: 145,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                            alignment: Alignment.topCenter,
                            child: AutoSizeText(
                              "시험을 선택하세요.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: font_size[4],
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 17,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color(btn_background),
                                  ),
                                  width: MediaQuery.of(context).size.width *
                                      0.375,
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionsBuilder:
                                          // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                                          // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                                              (context, animation,
                                              secondaryAnimation, child) {
                                            // Offset에서 x값 1은 오른쪽 끝 y값 1은 아래쪽 끝을 의미한다.
                                            // 애니메이션이 시작할 포인트 위치를 의미한다.
                                            var begin = const Offset(-1.0, 0);
                                            var end = Offset.zero;
                                            // Curves.ease: 애니메이션이 부드럽게 동작하도록 명령
                                            var curve = Curves.ease;
                                            // 애니메이션의 시작과 끝을 담당한다.
                                            var tween = Tween(
                                              begin: begin,
                                              end: end,
                                            ).chain(
                                              CurveTween(
                                                curve: curve,
                                              ),
                                            );
                                            return SlideTransition(
                                              position:
                                              animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                          // 함수를 통해 Widget을 pageBuilder에 맞는 형태로 반환하게 해야한다.
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          // (DetailScreen은 Stateless나 Stateful 위젯으로된 화면임)
                                          SCHPage(),
                                          // 이것을 true로 하면 dialog로 취급한다.
                                          // 기본값은 false
                                          fullscreenDialog: false,
                                        ),
                                      );
                                    },
                                    child: AutoSizeText(
                                      '교과',
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: font_size[3],
                                          fontWeight: regular),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(),
                              ),
                              Flexible(
                                flex: 17,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color(0xff00438C),
                                  ),
                                  width: MediaQuery.of(context).size.width *
                                      0.375,
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionsBuilder:
                                          // secondaryAnimation: 화면 전화시 사용되는 보조 애니메이션효과
                                          // child: 화면이 전환되는 동안 표시할 위젯을 의미(즉, 전환 이후 표시될 위젯 정보를 의미)
                                              (context, animation,
                                              secondaryAnimation, child) {
                                            // Offset에서 x값 1은 오른쪽 끝 y값 1은 아래쪽 끝을 의미한다.
                                            // 애니메이션이 시작할 포인트 위치를 의미한다.
                                            var begin = const Offset(-1.0, 0);
                                            var end = Offset.zero;
                                            // Curves.ease: 애니메이션이 부드럽게 동작하도록 명령
                                            var curve = Curves.ease;
                                            // 애니메이션의 시작과 끝을 담당한다.
                                            var tween = Tween(
                                              begin: begin,
                                              end: end,
                                            ).chain(
                                              CurveTween(
                                                curve: curve,
                                              ),
                                            );
                                            return SlideTransition(
                                              position:
                                              animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                          // 함수를 통해 Widget을 pageBuilder에 맞는 형태로 반환하게 해야한다.
                                          pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          // (DetailScreen은 Stateless나 Stateful 위젯으로된 화면임)
                                          SATPage(),
                                          // 이것을 true로 하면 dialog로 취급한다.
                                          // 기본값은 false
                                          fullscreenDialog: false,
                                        ),
                                      );
                                    },
                                    child: AutoSizeText(
                                      '수능',
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: font_size[3],
                                          fontWeight: regular),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
