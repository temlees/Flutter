
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("실습 앱",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        //우측 추가 action
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),
            color:  Colors.black,),
          IconButton(onPressed: (){}, icon: Icon(Icons.chat),
            color:  Colors.black,),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings),
            color:  Colors.black,),
        ],
      ),

      body: Column(
        children: [
          Row(
            children: [
              Image.asset("images.jpg", width: 200, height: 200),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("흰둥이",), Text("비숑"),Text("서울시 구로구"),Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 5),
                    Text("4"),
                  ],
                )],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset("images.jpg", width: 200, height: 200),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("흰둥이",), Text("비숑"),Text("서울시 구로구"),
                  Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 5),
                    Text("4"),
                  ],
                ),],
              ),
            ],
          ),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
        color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.home),color: Colors.white,)
              ,IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.white,),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications),color: Colors.white,),
              IconButton(onPressed: (){}, icon: Icon(Icons.person),color: Colors.white,)

            ],
          ),
    ),
    );
  }
}
