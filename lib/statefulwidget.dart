import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets_01.dart';
import 'package:flutterdemo/widgets_02.dart';
import 'package:flutterdemo/widgets_03.dart';
import 'package:flutterdemo/widgets_from_demo.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  return runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ScrollviewWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  @override
   State<StatefulWidget> createState(){
    return MyState();
  }
}

class MyState extends State<MyStatefulWidget>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(color: Colors.red,
                child: Text("+1",style: TextStyle(fontSize: 18),),
                onPressed:() {
                  setState(() {
                    counter++;
                  });
                },
              ),
              MaterialButton(color: Colors.blue,
                child: Text("-1",style: TextStyle(fontSize: 18)),
                onPressed:() {
                  setState(() {
                    counter--;
                  });
                },
              )
            ],
          ),
          Text("当前计数：$counter",style: TextStyle(fontSize: 30,decoration: TextDecoration.none)),
        ],
      )
    );
  }
}

