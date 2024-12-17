
import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuInsertWidget extends StatefulWidget {
  const MenuInsertWidget({super.key});

  @override
  State<MenuInsertWidget> createState() => _MenuInsertWidgetState();
}

class _MenuInsertWidgetState extends State<MenuInsertWidget> {
  TextEditingController _menuNameController = TextEditingController();
  TextEditingController _menuPriceController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _orderableController = TextEditingController();
  
  MenuModel _menuModel = MenuModel();


  //작성한 메뉴 등록하는 함수
  void _insertMenus() async{
    Map<String,dynamic> menuData = {
      "menuName" : _menuNameController.text,
      "menuPrice" : int.parse(_menuPriceController.text),
      "categoryCode" : int.parse(_categoryController.text),
      "orderableStatus" : _orderableController.text
    };
    try{
      String result = await _menuModel.insertMenu(menuData);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)),
      );
      Navigator.pushReplacementNamed(context, "home");
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error : $e")));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
    child: Column(
        children: [
          TextField(
            controller: _menuNameController,
            decoration: InputDecoration(labelText: "메뉴 이름"),
          ),
          TextField(
            controller: _menuPriceController,
            decoration: InputDecoration(labelText: "메뉴 가격"),
          ),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: "카테고리 태그"),
          ),
          TextField(
            controller: _orderableController,
            decoration: InputDecoration(labelText: "상태"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: _insertMenus, child: Text("메뉴 등록하기"))

        ],
    ),
    );
  }
}
