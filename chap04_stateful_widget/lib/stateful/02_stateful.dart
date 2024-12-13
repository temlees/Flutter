/*
* StatefulWidget
* - Flutter 에서 상태를 가진 위젯을 만들 때 사용함
* - Flutter 위젯은 기본적으로 불변이지만,
* StatefulWidget 을 사용하면 동적인 상태를 가진 위젯을 만들 수 있다.
* 위젯은 사용자 상호작용, 데이터 변화등으로
* 인해 상태가 변경될 수 있고 변경될때 마다 ui가 다시 빌드된다.
* */

import 'package:flutter/material.dart';

class StatefulTest extends StatefulWidget {
  const StatefulTest({super.key});

  //위에있는 클래스의 상태
  @override
  State<StatefulTest> createState() => _StatefulTestState();
}

// class _StatefulTestState extends State<StatefulTest> {
//   var a= 1;
//   @override
//   Widget build(BuildContext context) {
//     return
//         FloatingActionButton(child: Text(a.toString()),
//         onPressed: (){
//           print(a);
//           a++;
//         },
//         );
//   }
// }

/*
*   state를 변경시켜서 렌더링을 이르이키려면 setState 를 알아야한다
* Flutter 에서 setState() 가 호출되며ㅛㄴ , 부분 렌더링이 발생한ㅇ다
* 즉 전체 앱이나 전체 화면이 다시 렌더링되는게 아니라
* 상태가 변경된 특정 위젯만 다시 그려진다.
*
* 리액트는 돔 트리와 가상 돔 트리를 이용해 부분 렌더링을 하지만
* 플러터는 위젯 트리에서 특정 상태를 관리하는 부분 build 메소드만 다시 실행해 부분 랜더링한다.
* */

class _StatefulTestState extends State<StatefulTest> {
  var a= 1;
  @override
  Widget build(BuildContext context) {
    return
      FloatingActionButton(child: Text(a.toString()),
        onPressed: (){
          setState(() {
            a++;
          });
        },
      );
  }
}
