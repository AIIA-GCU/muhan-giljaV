import 'package:flutter/material.dart';

import 'package:aiia/config.dart';

class MajorInfo extends StatelessWidget {
  const MajorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
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
                          child: Icon(CustomIcon.statistic, size: 22, color: Color(btn_background))),
                      // 이름
                      Positioned(
                          top: 11,
                          left: 36,
                          child: Text("아잉",
                                style: TextStyle(
                                fontWeight: medium,
                                fontSize: font_size[4],
                                color: Color(font_color_1)
                              )
                          )
                      ),
                        Positioned(
                          top: 11,
                          right: 11,
                          child: Row(
                            children: [
                              Icon(CustomIcon.edit, size: 22, color: Colors.black),
                              Icon(Icons.close, size: 22, color: Color(btn_background))
                            ],
                          )
                        )
                  ])
              ),
              // 구분선
              const Divider(thickness: 1, color: Color(line_color)),
              // 전형
              Container(
                height: 56,
                margin: EdgeInsets.only(left: 16,top: 8, right: 16, bottom: 0),
                decoration: BoxDecoration(color: Colors.red),

              )
            ])
        )
    );
  }
}
