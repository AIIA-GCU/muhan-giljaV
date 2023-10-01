import 'package:flutter/material.dart';
import 'package:aiia/config/variables.dart';

class AddAverage extends StatelessWidget {
  List<List<String>> fruits = [
    ['a','b'],
    ['c,','e','d'],
    ['f','g','h','i']
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            ExpansionTile(title: Text("단과대학"),
              children: [
                ListTile(
                  title: Text("인문대학"),
                  onTap: (){
                    //학과선택 옵션 목록 수정
                  },
                ),
                ListTile(
                  title: Text("공학대학"),
                  onTap: (){
                    //학과선택 옵션 목록 수정
                  },
                ),
                ListTile(
                  title: Text("IT융합대학"),
                  onTap: (){
                    //학과선택 옵션 목록 수정
                  },
                ),
              ],
            ),
            ExpansionTile(title: Text("학과"),
              children: [

              ],
            ),
            ExpansionTile(title: Text("전형"),
              children: [
                ListTile(
                  title: Text("교과성적우수"),
                  onTap: (){

                  },
                ),
                ListTile(
                  title: Text("가천바람개비"),
                  onTap: (){

                  },
                ),
                ListTile(
                  title: Text("AI.SW전형"),
                  onTap: (){

                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
