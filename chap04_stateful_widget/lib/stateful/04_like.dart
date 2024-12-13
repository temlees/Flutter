import 'package:flutter/material.dart';

class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  var name =['피자','돈까스','치킨'];
  var like = [0,0,0];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,i){
        return ListTile(
          leading: Text(like[i].toString()),
          title: Text(name[i]),
          trailing: ElevatedButton(onPressed: (){
            setState(() {
              like[i]++;
            });
          }
          , child: Text("좋아요")),
        );
      },
    );
  }
}
