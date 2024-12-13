import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Quest extends StatefulWidget {
  const Quest({super.key});

  @override
  State<Quest> createState() => _QuestState();
}

class _QuestState extends State<Quest> {
  File? _image; //선택될 이미지 파일을 저장할 변수.
  final ImagePicker _picker = ImagePicker(); // 이미지 선택을 위한 인스턴스

  //갤러리에서 이미지를 선택하는 메소드
  Future<void> _pickerImageFromGallery() async{
    /*
    *  XFile 은 flutter 에서 주로 파일 선택이나 이미지 파일을 다룰 때 사용하는
    * 파일 처리 클래스이다.
    * File 과 유사하지만 다양한 파일 작업을 수행할 수 있다.
    * */
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    //선택된 파일이 있을 경우
    if(pickedFile != null){
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  //카메라로 사진을 촬영하는 메소드
  Future<void>_pickImageFromCamera() async{
    XFile? pickedFiled = await _picker.pickImage(source: ImageSource.camera);

    //촬영한 파일이 있을 경우
    if(pickedFiled != null){
      setState(() {
        _image = File(pickedFiled.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null ? Text('사진을 선택하세요') : Image.file(_image!) , //!null  아니라고 선언
          SizedBox(height: 20,),
          //갤러리에서 선택하는 버튼
          ElevatedButton(onPressed: _pickerImageFromGallery, child: Text('갤러리에서 사진선택'))
          ,
          ElevatedButton(onPressed: _pickImageFromCamera, child: Text('카메라'))
        ],
      ),
    );
  }
}
