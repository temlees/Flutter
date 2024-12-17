/*
* Http
* - Http 요청을 보내기 위해 사용하는 패키지
* - 서버와 통신할 때 Get,Post,Put,Delete 등 Http 메소드를
* 사용하여 데이터를 주고 받을 수 있게 해준다.
*
* http 패키지를 이용하는 이유
* - 네트워크 요청 관리 - 서버와 클라이언트간 통신을 간편하게 처리 할 수있다.
*  비 동기 작업 지원- 비동기적으로 요청을 처리하여 UI가 멈추지 않도록 한다.
* -RestFul API 와의 통합을 쉽게 처리할 수 있다.
*
*  DIO
*   - 실제적으로 많이 사용하는 http 통신
*   - http 요청을 처리하기 위한 강력하고 유연한 라이브러리 이다.
*    -http 패키지와 비슷한 역할을 하지만 , 더 많은 기능과 편의성을 제공
*    - json 데이터를 dart 객체로 자동 전환 하거나,
*    - dart 객체를 json 으로 자동변환 할 수 있다.
*     -인증 토큰 추가 공통 헤더 설정 등에 유용
*      멀티 파트 파일 업로드와 파일 다운로드를 간단하게 처리할  수 있다.
* */
import 'package:chap09_http_dio/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


