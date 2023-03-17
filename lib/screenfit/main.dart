import 'package:flutter/material.dart';
import 'size_fit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LLSizeFit.initialize();
    return MaterialApp(
      title: "demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
        splashColor: Colors.transparent
      ),
      home: LLHomePage(),
    );
  }
}

class LLHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
     final height = MediaQuery.of(context).size.height;
     final statusHeight = MediaQuery.of(context).padding.top;
     print("屏幕宽高: $width * $height");
     print("状态栏的高度: $statusHeight");
     print(LLSizeFit.screenWidth);

     print(200.px);
     print(400.rpx);

     return Scaffold(
       appBar: AppBar(
         title: Text("首页"),
       ),
       body: Center(
         child: Container(
           width: 200.px,
           height: 200.px,
           color: Colors.red,
           alignment: Alignment.center,
           child: Text("Hello World",style: TextStyle(fontSize: 20.px),),
         ),
       ),
     );

  }


}