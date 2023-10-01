import 'dart:async';

import 'package:aiia/config/variables.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

StreamController<Map<String, List<String>>> chart_sctr = StreamController<Map<String, List<String>>>.broadcast();

// 입시 결과표
class EntranceChart extends StatefulWidget {
  const EntranceChart({super.key});

  @override
  State<EntranceChart> createState() => _EntranceChartState();
}
class _EntranceChartState extends State<EntranceChart> {

  Stream<Map<String, List<String>>> stream = chart_sctr.stream;

  // 입시 결과표 리스트
  List<Widget> _children = [];

  // 업데이트
  void update(Map<String, List<String>> m) {
    setState(() {
      String depart = m.keys.first;
      if (depart == "remove")
        _children.removeWhere((element) => element.key.toString() == m[depart]!.first);
      else _children.add(Info(
          key: UniqueKey(),
          department: depart,
          examinations: m[depart]!
      ));
    });
  }

  @override
  void initState() {
    stream.listen((event) => update(event));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _children);
  }
}

// 정보
class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.department,
    required this.examinations
  }) : super(key: key);

  final String department;
  final List<String> examinations;

  @override
  Widget build(BuildContext context) {
    print(examinations);
    List<Widget> children = examinations
        .map((e) =>  AdmissionUnit(e,30,3.78,2.93,24))
        .toList();
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        padding: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(widget_background)),
        child: Column(children: [
          // 타이틀
          Container(
              height: 34,
              child: Stack(
                  children: [
                    // 학부&학과명
                    Positioned(
                      top: 11,
                      left: 11,
                      child: Row(
                        children: [
                          Icon(CustomIcon.statistic, size: 22, color: Color(btn_background)),
                          SizedBox(width: 4,),
                          AutoSizeText(department,
                              style: TextStyle(
                                  fontWeight: medium,
                                  fontSize: font_size[4],
                                  color: Color(font_color_1)
                              )
                          )
                        ],
                      ),
                    ),
                    // 아이콘
                    Positioned(
                        top: 11,
                        right: 11,
                        child: Row(
                          children: [
                            // 수정
                            InkWell(
                                onTap: () {},
                                child: Icon(CustomIcon.edit_rect, size: 22, color: Colors.black)),
                            SizedBox(width: 4,),
                            // 삭제
                            InkWell(
                                onTap: () => chart_sctr.add({ "remove" : [key.toString()] }),
                                child: Icon(CustomIcon.cancel, size: 22, color: Colors.black))
                          ],
                        )
                    )
                  ])
          ),
          Container(height: 1,margin: EdgeInsets.only(top: 11),color: Color(line_color)),
          // 전형
          Container(
            margin: EdgeInsets.only(left: 16,top: 16, right: 16),
            child: Column(children: children)
          )
        ])
    );
  }
}

//모집전형 블럭
class AdmissionUnit extends StatelessWidget {
  final String unit;
  final int recruit;
  final double grade;
  final double o_grade;
  final double rate;
  const AdmissionUnit(this.unit,this.recruit,this.grade,this.o_grade,this.rate,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 전형 이름
        AutoSizeText("${unit}(${recruit})",style: TextStyle(fontSize: 12,fontWeight: medium),),
        SizedBox(height: 2,),
        // 입시 결과 - 숫자
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText("${grade}",style: TextStyle(fontSize: 11,color: Color(etc_color_3)),),
            AutoSizeText("${o_grade}",style: TextStyle(fontSize: 11,color: Color(etc_color_2)),),
            AutoSizeText("${rate.toInt()}:1",style: TextStyle(fontSize: 11),),
          ],
        ),
        // 입시 결과 - 그래프
        Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double columnWidth = constraints.maxWidth; // 부모 Column의 가로 크기 가져오기
                return LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  width: columnWidth, // 부모 Column의 가로 크기로 설정
                  lineHeight: 14.0, // 게이지 바의 높이
                  percent: (9-grade)/8, // 퍼센트 값 (0.0부터 1.0까지)
                  backgroundColor: Color(etc_color_1), // 게이지 바의 배경색
                  progressColor: Color(btn_background), // 게이지 바의 진행색
                  barRadius: Radius.circular(50),
                );
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                double columnWidth = constraints.maxWidth; // 부모 Column의 가로 크기 가져오기

                return Container(
                  height: 14,
                  decoration: BoxDecoration(border: Border.all(color: Color(etc_color_2),width: 1,style: BorderStyle.solid),borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.zero,
                  width: columnWidth*(9-o_grade)/8, // 부모 Column의 가로 크기로 설정
                );
              },
            ),
          ],
        ),
        // 그 외
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText("교과성적",style: TextStyle(fontSize: 11,color: Color(font_color_2))),
            AutoSizeText("100%",style: TextStyle(fontSize: 11,color: Color(font_color_2))),
          ],
        ),
      ],
    );
  }
}