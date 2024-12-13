import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text('제목입니다'),
      ),actions: [Icon(Icons.search)],
    ),
      body: Column(
        children: [
          Row(
            children: [Text('강아지'),Icon(Icons.search),Column(
              children: [Text('가로'),Text("쓰기")],
            )],
           )
          , Row(
    children: [Text('강아지'),Icon(Icons.search)],)
        ],
      ),
      
    );
  }
}

