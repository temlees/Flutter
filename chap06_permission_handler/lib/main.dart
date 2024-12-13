import 'package:chap06_permission_handler/permission/01_contact_page.dart';
import 'package:chap06_permission_handler/permission/02_camera_page.dart';
import 'package:chap06_permission_handler/permission/03_quest.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter contact App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈 화면"),
      ),
      body:
      //전화번호 관련 권한 받기,
      //ContactsPage(),
      // 카메라
      //CameraPermissionPage()
      Quest()
    );
  }
}

/*
* https://pub.dev/ 플러터 라이브러리
permission_handler ->권한 허용
flutter_contacts-> 전화번호부

android xml에 query밑에
<uses-permission android:name="android.permission.READ_CONTACTS"/>
    <uses-permission android:name="android.permission.WRITE_CONTACTS"/>
읽기 쓰기 권한 추가.

image picker카메라 이미지


권한 추가
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
*
* */

