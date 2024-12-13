
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
   var input1 =  TextEditingController();
   var input2 =  TextEditingController();

  var lists = ['바나나','과자','집'];
   var subTiltles = [];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView.builder(itemBuilder: (context,i){
          return ListTile(
            leading: Text((i+1).toString()),
            title: Text(lists[i]),
            trailing: TextButton(onPressed: (){
              setState(() {
                lists.removeAt(i);
              });
            }, child: Text('삭제')),
          );
        }))
     ,Align(alignment: Alignment.bottomRight, child: TextButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('메뉴 등록'),
            content: Column(
              children: [
                TextField(
                  controller: input1,
                  decoration: InputDecoration(hintText: "입력칸"),
                ),
                TextField(
                  controller: input2,
                  decoration: InputDecoration(hintText: "입력칸2"),
                )
              ],
            ),
            actions: [TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("취소")), TextButton(onPressed: (){
              setState(() {
                lists.add(input1.text);
                subTiltles.add(input2.text);
                input1.clear();
                input2.clear();
              });
            }, child: Text('확인'))] ,
          );
        });
        }, child: Text('등록')),)],
    );
  }
}
