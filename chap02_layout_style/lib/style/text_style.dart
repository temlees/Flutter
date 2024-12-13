
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Layout-Test"),)
        ,),
      body: Center(
        child: Text("텍스트 스타일적용",
          style: TextStyle(color: Colors.purple,fontSize: 30),
          /*
          *   color
          * Colors.red - 미리 정해진 색상표에서 고르는 법
          * Color.fromRGBO - rgbo로 고르는 방법.
          * Color(Oxfffffff)-Hexadecimal 색상 값으로 고르는 방법.
          * 
          * backgroundColor : 배경색
          * fontSize
          * fontWeight
          * fontFamily
          * 등등 필요한 속성 찾아쓰면 된다.
          * */
        ),
      ),
    );
  }
}
