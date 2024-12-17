
import 'package:chap09_http_dio/models/01_api_model.dart';
import 'package:flutter/material.dart';

class ScrollViewWidget extends StatefulWidget {
  const ScrollViewWidget({super.key});

  @override
  State<ScrollViewWidget> createState() => _ScrollViewWidgetState();
}

class _ScrollViewWidgetState extends State<ScrollViewWidget> {

 final ApiModel apiModel = ApiModel();
 List<dynamic> _posts = [];
 var page = 0;//페이지 변수
 var scroll = ScrollController(); // 스크롤바 위치를 기억해주는 컨트롤러
 bool _isLoading = false;  //로딩 상태

 //스크롤 이벤트 리스너 생성
 void eventListener(){
   scroll.addListener((){
     //현재 스크롤 위치를 픽셀 단위로 가져옵니다.
     //스크롤이 이동할 수 있는 최대 위치를 나타냅니다 즉, 스크롤이 맨 아래에 도달하면 pixels 값이 maxScrollExtent 값
     if(scroll.position.pixels == scroll.position.maxScrollExtent && !_isLoading){
       _loadMorePosts();
     }
   });
 }


 @override
  void initState() {
   super.initState();
   _loadPosts(); // 최초 데이터 로드
   eventListener();// 스크롤 리스너 등록
//
  }


 @override
  void dispose() {
   scroll.removeListener(eventListener); //리스너 제거
   scroll.dispose(); // 스크롤 리소스 정리
   super.dispose();
//
  } //처음 게시글 목록을 로드 하는 함수
 Future<void> _loadPosts() async{
   List<dynamic> posts = await apiModel.fetchGets();
   setState(() {
     _posts = posts;
   });
 }

 //추가 게시물 목록을 로드하는 함수
 Future<void> _loadMorePosts() async{
   if(_isLoading) return; // 이미 로딩중이면 요청 x
   setState(() {
     _isLoading = true;
   });
   page++;//페이지 증가
   try{
     List<dynamic> posts = await apiModel.fetchGets3(page);
     setState(() {
       _posts.addAll(posts); // 기존 목록에 추가하기
       _isLoading = false;
     });
   }catch (e){
     print("에러발생 : $e");
     setState(() {
       _isLoading = false;
     });
   }
 }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Expanded(child: _posts.isEmpty? Center(child: Text("로딩중"),)
        : ListView.builder(controller: scroll,
        itemCount: _posts.length+1,
          itemBuilder: (context,i){
          if(i == _posts.length){
            return _isLoading? Center(
              child: CircularProgressIndicator(),
            )
                :SizedBox.shrink();
          }
          return ListTile(
            leading: Text(i.toString()),
            title: Text(_posts[i]['title']),
            subtitle: Text(_posts[i]['body']),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),

          );
          },
        )
        )
      ],
    ),
    );
  }


}
