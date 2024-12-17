import 'package:chap10_spring_to_flutter/screen/main_screen.dart';
import 'package:chap10_spring_to_flutter/widget/insert_widget.dart';
import 'package:chap10_spring_to_flutter/widget/update_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //인덱스 번호
  int _selectedIndex = 0;

  //탭에 따라 표시할 화면들
  final List<Widget> _pages = [
    MainScreen(),
    MenuUpdateWidget(),
    MenuInsertWidget(),
    Center(child: Text("수정회면",style: TextStyle(fontSize: 30)),),
    Center(child: Text("삭제화면",style: TextStyle(fontSize: 30)),)
  ];

  // 탭선택시 해당 인덱스번호로 할당하는 함수
  void _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

  }

/*
* onTap 이벤트가 발생하면 index 값을 자동으로 onTap 함수의 매개변수로 넘겨준다
BottomNavigationBar가 클릭된 탭의 인덱스를 전달하기 때문입니다.
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Restrant"),
        backgroundColor: Colors.black,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "홈"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
              label: "메뉴조회"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart),
              label: "메뉴등록"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.update),
              label: "메뉴 수정"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.delete),
              label: "메뉴삭제"
          )
        ],
      ),
    );
  }
}
