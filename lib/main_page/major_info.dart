import 'package:flutter/material.dart';

import 'package:aiia/config.dart';

import 'package:percent_indicator/percent_indicator.dart';

class MajorInfo extends StatelessWidget {
  const MajorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(widget_background)),
        child: Column(children: [
          // 타이틀
          Container(
              height: 34,
              child: Stack(
                  children: [
                    // 아이콘
                    Positioned(
                      top: 11,
                      left: 11,
                      child: Row(
                        children: [
                          Icon(CustomIcon.statistic, size: 22, color: Color(btn_background)),
                          SizedBox(width: 4,),
                          Text("아잉",
                              style: TextStyle(
                                  fontWeight: medium,
                                  fontSize: font_size[4],
                                  color: Color(font_color_1)
                              )
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 11,
                        right: 11,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: (){},//수정
                                child: Icon(CustomIcon.edit_rect, size: 22, color: Colors.black)),
                            SizedBox(width: 4,),
                            InkWell(
                                onTap: (){},//삭제
                                child: Icon(CustomIcon.cancel, size: 22, color: Colors.black))
                          ],
                        )
                    )
                  ])
          ),
          //Divider위젯은 기본 마진값이 있어서 밑 내용들에 위치를 잡기 힘들어 Container로 대체합니다.
          Container(height: 1,margin: EdgeInsets.only(left: 0,top: 11,right: 0,bottom: 0),color: Color(line_color)),
          // 전형
          Container(
            height: 56,
            margin: EdgeInsets.only(left: 16,top: 16, right: 16, bottom: 0),
            // decoration: BoxDecoration(color: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('교과성적우수 (30)',style: TextStyle(fontSize: 12,fontWeight: medium),),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("00.00",style: TextStyle(fontSize: 11,color: Color(etc_color_3)),),
                    Text("00.00",style: TextStyle(fontSize: 11,color: Color(etc_color_2)),),
                    Text("00:00",style: TextStyle(fontSize: 11),),
                  ],
                ),
                Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double columnWidth = constraints.maxWidth; // 부모 Column의 가로 크기 가져오기

                        return LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          width: columnWidth, // 부모 Column의 가로 크기로 설정
                          lineHeight: 14.0, // 게이지 바의 높이
                          percent: 0.7, // 퍼센트 값 (0.0부터 1.0까지)
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
                          width: columnWidth*90/100, // 부모 Column의 가로 크기로 설정

                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("교과성적",style: TextStyle(fontSize: 11,color: Color(font_color_2))),
                    Text("100%",style: TextStyle(fontSize: 11,color: Color(font_color_2))),
                  ],
                ),
              ],
            ),
          )
        ])
    );
  }
}
