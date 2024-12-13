
import 'package:flutter/material.dart';
/*
* ListTile
* -Flutter 에서 리스트 아이템을 간편하게 구성할 수 있는ㄷ 위젯
* -텍스트 , 아이콘, 이미지 등을 간단하게 배치할 수 있어 설정화면,
* 채팅목록 연락처 목록 등의 리스트에서 자주 사용
* 레이아웃 편하게 구성되어 있다.
* */
class ListApp2 extends StatelessWidget {
  const ListApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("리스트 테스트"),
        ),
      ),
      body: ListView(
        children: [
        ListTile(
          //leading 제일 왼편
          leading: Image.asset("assets/images.jpg"), //보통 이미지나 아이콘
          title: Text("검둥이"), 
          subtitle: Text("비숑"),  //부제목 
          trailing: Icon(Icons.delete), // 제일 오른편
          onTap: (){},
        )
          ,Padding(padding: EdgeInsets.only(top: 10)),
          ListTile(
            //leading 제일 왼편
            leading: Image.asset("assets/images.jpg"), //보통 이미지나 아이콘
            title: Text("검둥이"),
            subtitle: Text("비숑"),  //부제목
            trailing: Icon(Icons.delete), // 제일 오른편
            onTap: (){},
          ),
    ListTile(
    //leading 제일 왼편
    leading: Image.asset("assets/images.jpg"), //보통 이미지나 아이콘
    title: Text("검둥이"),
    subtitle: Text("비숑"),  //부제목
    trailing: Icon(Icons.delete), // 제일 오른편
    onTap: (){},
    )
        ],

      ),
    );
  }
}
