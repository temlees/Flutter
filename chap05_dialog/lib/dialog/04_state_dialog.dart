import 'package:flutter/material.dart';

class DialogTest5 extends StatefulWidget {
  const DialogTest5({super.key});

  @override
  State<DialogTest5> createState() => _DialogTest5State();
}
//TextEditingController : 텍스트 필드 안에서 값이 변동되는것을 감지하는 메서드, 하나만 읽을 수 있다
class _DialogTest5State extends State<DialogTest5> {
  var inputData = TextEditingController();
  String name = "null";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(name != 'null')Text(name,style: TextStyle(fontSize: 25),),
          SizedBox(height: 20,),ElevatedButton(
            child: Text('등록',style: TextStyle(fontSize: 20),)
            ,onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('이름 입력'),
                  content: TextField(
                    controller: inputData,
                    decoration: InputDecoration(hintText: '이름을 입력'),
                  ),
                  actions: [TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('취소')),
                    TextButton(onPressed: (){
                      setState(() {
                        name = inputData.text.isNotEmpty? inputData.text : name;
                      });
                      Navigator.of(context).pop();}, child: Text('확인'))
                  ],
                );
              });
          },)
        ],
      ),
    );
  }
}
