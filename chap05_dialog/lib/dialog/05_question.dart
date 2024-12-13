import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var inputData1 = TextEditingController();
  var inputData2 = TextEditingController();
  var titles = [];
  var subTiltles = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded( // ListView.builder를 확장 가능한 위젯으로 감쌈
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Text((i+1).toString()),
                title: Text(titles[i]),
                trailing: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      titles.removeAt(i); // 항목 삭제
                    });
                  },
                  child: Text('삭제'),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('일정등록'),
                content:
                Column(
                  children: [
                  TextField(
                  controller: inputData1,
                  decoration: InputDecoration(hintText: '제목을 입력하세요'),
                ) ,
                    TextField(
                      controller: inputData2,
                      decoration: InputDecoration(hintText: '상세 내용을 입력하세요'),
                    ),
                ]
              )
                  ,actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('취소'))
             , TextButton(onPressed: (){
               setState(() {
                 titles.add(inputData1.text);
                 subTiltles.add(inputData2.text);
                 inputData1.clear();
                 inputData2.clear();
                 Navigator.of(context).pop();
               });
                }, child: Text('확인'))
              ],


              );
            });
          }, child:Text('등록',style: TextStyle(fontSize: 50),))
        )],


    );
  }}