import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  //연락처를 저장할 리스트
  List<Contact> _contact = [];

//위젯이 호출되고 제일 먼저 실행 될 메소드
  @override
  void initState() {
    super.initState();
    _checkPermissionAndFetchContacts();

  }

  //권한 체크 및 연락처 가져오는 메소드
  //Future= 비동기함수 , async await 함수를 쓰려면 반환값이 Future여야 한다.
  Future<void> _checkPermissionAndFetchContacts() async{
    //연락처 접근 권한 요청
    PermissionStatus permissionStatus = await Permission.contacts.request();
    //권한 허용 여부 체크
    if(permissionStatus.isGranted){
      _getContacts();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('연락처 권한이 필요합니다')));
    }
  }

  //연락처를 실제로 가져오는 메소드
  Future<void> _getContacts() async{
    /*
    *   연락처 가져오기
    * var contacts = await FlutterContacts.getContacts();
    * -그런데 연락처에 저장된 썸네일 이미지나 다른 정보들 까지 다 가져오면
    * 너무 느리기 때문에 이름과 전화번호 같은 properties 만 가져오게 설정
    * */
    try{
      final contacts = await FlutterContacts.getContacts(
        withProperties: true,withPhoto: false);

      setState(() {
        _contact = contacts; // 가져온 연락처 데이터를 저장함...
      });
    }catch(e){
      print("연락처를 가져오는 중 오류 발생 : $e");
    }

  }

  //연락처 추가를 위한 다이얼 로그 메소드
  void _showAddContactDialog(){
    String name = ''; //새 연락처 이름
    String phone = ''; //새 연락처 전화번호

    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("새 연락처 추가"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "이름"),
              onChanged: (value){
                name = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "전화번호"),
              keyboardType: TextInputType.phone, // 전화번호 입력 모드
              onChanged: (value){
                phone = value;
              },
            )
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('취소'))
          , TextButton(onPressed: (){
            if(name.isNotEmpty && phone.isNotEmpty){
              _addContact(name,phone);
              Navigator.pop(context);
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('이름과 전화번호를 모두 입력하세요')));
            }
          }, child: Text('등록'))
        ],
      );
    });
  }

  Future<void> _addContact(String name, String phone) async{

    //연락처 저장 권한 확인
    if(await FlutterContacts.requestPermission()){
      final newContact = Contact()  //Contact객체 만들어서 insert 메소드 사용
          ..name.first = name
          ..phones = [Phone(phone)];  //리스트 만들어서 넣어줌
      await newContact.insert();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text('새 연락처가 저장됨') ));
      _getContacts();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('저장권한이 필요합니다') ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //연락처 목록 표시 영역
        Expanded(
            child: ListView.builder(
              itemCount: _contact.length,
              itemBuilder: (context,i){
          var contact = _contact[i];
          return ListTile(
            title: Text(contact.displayName),
            subtitle: Text(contact.phones.isNotEmpty
                ? contact.phones.first.number : "전화번호 없음"),
          );
        },)),
        Padding(padding: EdgeInsets.all(16),child:
          ElevatedButton(onPressed: (){_showAddContactDialog();}, child: Text('연락처 추가')),)
      ],
    );
  }
}
