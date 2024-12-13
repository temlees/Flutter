import 'package:flutter/material.dart';

//Flutter 어플리케이션의 진입점이 되는 메소드
void main() {
  // 주어진 위젯 기준으로 위젯 트리를 만든다.
  runApp(const MyApp());
}
//한 번 생성되면 변경되지 않을 위젯.
//MyApp,은 Flutter 앱의 루트 위젯이다.

/*
*   앱의 전반적인 테마 설정 - 텍스트 스타일, 버튼 스타일 등
*  총 페이지 설정 - home 속성을 통해서 처음 앱을 실행할때 보여줄 초기 화면 지정
* 라우팅 및 네비게이션 설정 등등
* */
class MyApp extends StatelessWidget {
  const MyApp({super.key});  //key 를 부모에 전달 해줘야 위젯 트리에  포함 되게 된다.


  /*
  *   build()
  *   - 위젯 트리를 구성하고 해당 트리를 기반으로 화면에 표시될 UI를 정의하는 메소드
  * */
  @override
  Widget build(BuildContext context) {
    //Material 안드로이드에 적용하려고 구글이 만든 디자인 규칙
    //하지만 꼭 안드로이드 전용은 아님
    //플러터는 크로스 플랫폼 프레임워크이기때문에 IOS,웹 데스크톱 등 다양한 플랫폼에서 실행 가능

    //Flutter 어플리케이션은 Meterial Design 을 기반으로
    //전반적인 테마 , 라우팅 ,기본 스타일 및 네비게이션을 관리한다.

    //주요속성
    // title  = 앱의 제목
    // theme = 앱의 기본 테마를 정의 , 색상 , 텍스트등
    // home = 앱의 기본 화면을 설정한다, 일반적으로 첫 번째 화면을 표시하는 위젯
    // routes = 라우트를 정의하는데 사용된다.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "우리들의 첫 플러터 앱"),
    );
  }

}



/*
  * 위젯 ?
  * - HTML 의 개발방식은 태그
  * -<P>안녕하세요</p>
  *
  * Flutter 는 위젯을 사용한다
  * 글자를 넣고 싶으면 Text, 이미지 Image
  * 네모박스 혹은 컨테이너는 Container()
  * */

//stless 자동완성
//타이틀 전달받기때문에
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  /*
  *   Scaffold는 기본적인 화면의 구조를 제공한다.
  * Flutter 에서 기본적인 화면 구조를 쉽게 설정할 수 있게 해주는 위젯
  * 속성
  * - appbar  = 앱의 상단에 표시된는 앱바
  * - body = 화면의 메인 콘텐츠 영역
  * -drawer = 앱의 왼쪽에서 오른쪽으로 스와이프 해 열수 있는 네비
  * - bottomNavigationBar = 앱의 하단 네비바.
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: //const Center(
        //   child: Text("플러터 앱"),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:  MainAxisAlignment.spaceAround,
          children: [Text("플러터 앱"),
            SizedBox( width: 8,),
            Icon(Icons.star)],
        ),
      ),

      body: Center(
        //child  센터 위젯은,텍스트 위젯 하나이다.
        //여러개  넣고 싶으면 Row children 으로 여러개 가능
      //  child: Text(title , style: TextStyle(fontSize: 30, color: Colors.pink),),
    //    child: Icon(Icons.search),
        child: Image.asset("assets/짱구1.png"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Text("하단바 입니다"),
        ),
      ),
      
    );
  }
}


