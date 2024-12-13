import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class DialogTest2 extends StatelessWidget {
  const DialogTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){},
          child: TextButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('Alert Dialog'),
                content: Text('정말로 이 작업을 수행하시겠습니까?'),
                actions: [  TextButton(onPressed: (){
                  //작업 실행 창 닫기
                  Navigator.of(context).pop();
                }, child: Text('취소')),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text('확인'))
                ],
              ); 
            });
          },
          child: Text('버튼', style: TextStyle(fontSize: 30),))),
    );
  }
}

//cupertino dialog

class DialogTest3 extends StatelessWidget {
  const DialogTest3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton( child: Text('버튼', style: TextStyle(fontSize: 30),),
          onPressed: (){
        showDialog(context: context, builder: (context){
          return CupertinoAlertDialog(
            title: Text('알림장'),
            content: Text('이 작업을 진행 하겠음 ?'),
            actions: [
              CupertinoDialogAction(child: Text('취소'),
              onPressed: (){
                Navigator.of(context).pop();},),
          CupertinoDialogAction(child: Text('확인'),
          onPressed: (){  Navigator.of(context).pop();},
              )
            ],
          );
        });
          } ),
    );
  }
}

