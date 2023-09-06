///
/// My Grade 위젯
/// - Size (width : height) = 345 : 200
/// - 아이콘 추가해야 함
///

import 'package:aiia/config.dart';

import 'package:flutter/material.dart';

import '../grade_upload_page/mainPage.dart';

class MyGrade extends StatefulWidget {
  const MyGrade({super.key});

  @override
  State<MyGrade> createState() => _MyGradeState();
}

class _MyGradeState extends State<MyGrade> {
  bool isUpload = false; // 성적 업로드를 했는가?

  List<double> avgs = [0.0, 0.0, 0.0]; // 학년별 평균
  double total_avg = 0.0; // 전체 학년 평균
  double reuslt = 0.0; // 가천대식 평균

  // 성적 업로드 페이지 이동
  void _migratePage() {

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
        MainPage(),
        // 이것을 true로 하면 dialog로 취급한다.
        // 기본값은 false
        fullscreenDialog: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(widget_background)),
            child: Column(children: [
              // 타이틀
              Container(
                  height: 34,
                  child: Stack(children: [
                    // 아이콘
                    Positioned(
                      top: 11,
                      left: 11,
                      child: Row(
                        children: [
                          Icon(CustomIcon.document, size: 22, color: Color(btn_background)),
                          SizedBox(width: 4,),
                          Text("My Grade",
                              style: TextStyle(
                                  fontWeight: medium,
                                  fontSize: font_size[4],
                                  color: Color(font_color_1)
                              )
                          )
                        ],
                      ),
                    ),
                    // 수정 버튼
                    if (isUpload)
                      Positioned(
                          top: 11,
                          right: 11,
                          child: GestureDetector(
                              onTap: _migratePage,
                              child: Icon(CustomIcon.edit,
                                  size: 20, color: Color(btn_background))))
                  ])),
              // 구분선
              //Divider위젯은 기본 마진값이 있어서 밑 내용들에 위치를 잡기 힘들어 Container로 대체합니다.
              Container(height: 1,margin: EdgeInsets.only(left: 0,top: 11,right: 0,bottom: 0),color: Color(line_color)),

              // 성적
              Expanded(
                  child: isUpload
                      // 성적이 업로드 된 경우
                      ? Container(
                      margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 11),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(children: [
                                      Text("1",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              fontSize: font_size[1],
                                              color: Color(font_color_2))),
                                      Text(avgs[0].toString(),
                                          style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: font_size[3],
                                              color: Color(font_color_1)))
                                    ]),
                                    Column(children: [
                                      Text("2",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              fontSize: font_size[1],
                                              color: Color(font_color_2))),
                                      Text(avgs[1].toString(),
                                          style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: font_size[3],
                                              color: Color(font_color_1)))
                                    ]),
                                    Column(children: [
                                      Text("3",
                                          style: TextStyle(
                                              fontWeight: regular,
                                              fontSize: font_size[1],
                                              color: Color(font_color_2))),
                                      Text(avgs[2].toString(),
                                          style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: font_size[3],
                                              color: Color(font_color_1)))
                                    ])
                                  ]),
                            ),
                            const Divider(
                                height: 1,
                                thickness: 1,
                                color: Color(line_color)),
                            Expanded(
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                  Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("나의 총 평균",
                                            style: TextStyle(
                                                fontWeight: regular,
                                                fontSize: font_size[1],
                                                color: Color(font_color_2))),
                                        Text(total_avg.toString(),
                                            style: TextStyle(
                                                fontWeight: bold,
                                                fontSize: font_size[5],
                                                color: Color(font_color_1)))
                                      ]),
                                  VerticalDivider(
                                      width: 1,
                                      thickness: 1,
                                      color: Color(line_color)),
                                  Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("가천대식 평균",
                                            style: TextStyle(
                                                fontWeight: regular,
                                                fontSize: font_size[1],
                                                color: Color(font_color_2))),
                                        Text(reuslt.toString(),
                                            style: TextStyle(
                                                fontWeight: bold,
                                                fontSize: font_size[5],
                                                color: Color(font_color_1)))
                                      ])
                                ]))
                          ]))
                      // 성적이 업로드 되지 않은 경우
                      : Center(
                          child: GestureDetector(
                              onTap: _migratePage,
                              child: Icon(CustomIcon.add,
                                  size: 52, color: Color(btn_background)))))
            ])));
  }
}
