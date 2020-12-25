import 'package:flutter/material.dart';

class Exp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < 5; i++){
      list.add(new Text("test"));
    }
    List list2 = [1, 2, 3, 66];
    print(list2);
    list2.forEach((e){
      print(e);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: list2.map((item) => new Text("test")).toList(),
          ),
        ),
      ),
    );
  }

}
