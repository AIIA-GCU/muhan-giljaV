import 'package:flutter/material.dart';

class AddAverage extends StatefulWidget {
  const AddAverage({super.key});

  @override
  State<AddAverage> createState() => _AddAverageState();
}

class _AddAverageState extends State<AddAverage> {
  var _value = "-1";
  var _comboValue = "-1"; // New variable for the combo box value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 7.0),//icon add average 위치 조정
            child:Row(
              children: [
                Icon(Icons.auto_graph_outlined),
                SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      'Add Average',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child:Column(
              children: [
                Divider(
                  color: Colors.black26,
                  thickness: 1.0,
                ),
              ],
            ),
          ), //경계선
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0),//간격
              child: DropdownButtonFormField(
                menuMaxHeight: 220,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),//크기조절
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: _value,
                items: [
                  DropdownMenuItem(child: Text("-select City-"),value:"-1"),
                  DropdownMenuItem(child: Text("-select City-"),value:"1",),
                  DropdownMenuItem(child: Text("-select City-"),value:"2",),
                  DropdownMenuItem(child: Text("-select City-"),value:"3",),
                  DropdownMenuItem(child: Text("-select City-"),value:"4",),
                  DropdownMenuItem(child: Text("-select City-"),value:"5",),
                  DropdownMenuItem(child: Text("-select City-"),value:"6"),
                  DropdownMenuItem(child: Text("-select City-"),value:"7",),
                  DropdownMenuItem(child: Text("-select City-"),value:"8",),
                  DropdownMenuItem(child: Text("-select City-"),value:"9",),
                  DropdownMenuItem(child: Text("-select City-"),value:"10",),
                  DropdownMenuItem(child: Text("-select City-"),value:"11",),
                  DropdownMenuItem(child: Text("-select City-"),value:"12"),
                  DropdownMenuItem(child: Text("-select City-"),value:"13",),
                  DropdownMenuItem(child: Text("-select City-"),value:"14",),
                  DropdownMenuItem(child: Text("-select City-"),value:"15",),
                  DropdownMenuItem(child: Text("-select City-"),value:"16",),
                  DropdownMenuItem(child: Text("-select City-"),value:"17",)
                ],
                onChanged: (v) {
                  setState(() {
                    _value = v.toString();
                  });
                },
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0),//간격
              child: DropdownButtonFormField(
                menuMaxHeight: 220,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),//크기조절
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: _value,
                items: [
                  DropdownMenuItem(child: Text("-select City-"),value:"-1"),
                  DropdownMenuItem(child: Text("-select City-"),value:"1",),
                  DropdownMenuItem(child: Text("-select City-"),value:"2",),
                  DropdownMenuItem(child: Text("-select City-"),value:"3",),
                  DropdownMenuItem(child: Text("-select City-"),value:"4",),
                  DropdownMenuItem(child: Text("-select City-"),value:"5",),
                  DropdownMenuItem(child: Text("-select City-"),value:"6"),
                  DropdownMenuItem(child: Text("-select City-"),value:"7",),
                  DropdownMenuItem(child: Text("-select City-"),value:"8",),
                  DropdownMenuItem(child: Text("-select City-"),value:"9",),
                  DropdownMenuItem(child: Text("-select City-"),value:"10",),
                  DropdownMenuItem(child: Text("-select City-"),value:"11",),
                  DropdownMenuItem(child: Text("-select City-"),value:"12"),
                  DropdownMenuItem(child: Text("-select City-"),value:"13",),
                  DropdownMenuItem(child: Text("-select City-"),value:"14",),
                  DropdownMenuItem(child: Text("-select City-"),value:"15",),
                  DropdownMenuItem(child: Text("-select City-"),value:"16",),
                  DropdownMenuItem(child: Text("-select City-"),value:"17",)
                ],
                onChanged: (v) {
                  setState(() {
                    _value = v.toString();
                  });
                },
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(6.0), //간격
              child: DropdownButtonFormField(
                menuMaxHeight: 220,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 1.0),//크기조절
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: _comboValue, // Use the new variable for value
                items: [
                  DropdownMenuItem(child: Text("-select Option-"),value: "-1"),
                  DropdownMenuItem(child: Text("-select City-"),value:"1",),
                  DropdownMenuItem(child: Text("-select City-"),value:"2",),
                  DropdownMenuItem(child: Text("-select Option-"), value: "3"),
                  DropdownMenuItem(child: Text("-select City-"),value:"4",),
                  DropdownMenuItem(child: Text("-select City-"),value:"5",),
                  DropdownMenuItem(child: Text("-select Option-"), value: "6"),
                  DropdownMenuItem(child: Text("-select City-"),value:"7",),
                  DropdownMenuItem(child: Text("-select City-"),value:"8",),
                ],
                onChanged: (v) {
                  setState(() {
                    _comboValue = v.toString(); // Update the new variable
                  });
                },
              ),
            ),
          ),
          SizedBox(height:15.0),//dropdown버튼과 등록하기 버튼 사이 간격
          Center(
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 55,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: ElevatedButton(
                onPressed: () {},
                child:Text('등록하기')
              ),
            ),
          ),//등록하기 버튼
        ]
      )
    );
  }
}
