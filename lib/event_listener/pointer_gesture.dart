import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(primarySwatch: Colors.blue,splashColor: Colors.transparent),
     home: ListenerDemo(),
     );
  }
}




/// 手势相关
class GestureDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Center(
       child: GestureDetector(
         onTapDown: (details){
           print("手指按下");
           print(details.globalPosition);
           print(details.localPosition);
         },
         onTapUp: (details){
           print("手指抬起");
         },
         onTapCancel: (){
           print("手势取消");
         },
         onTap: (){
           print("手势点击");
         },
         onDoubleTap: (){
           print("手势双击");
         },
         onLongPress: (){
           print("长按手势");
         },
         child: Container(
           width: 200,
           height: 200,
           color: Colors.orange,
         ),
       ),
     );
  }
}


class ListenerDemo extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
      return Listener(
        onPointerDown: (event){
          print("指针按下: $event");
          print(event.position);
          print(event.localPosition);
        },

        onPointerMove: (event){
          print("指针移动: $event");
        },
        onPointerUp: (event){
          print("指针抬起：$event");
        },

        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
      );
  }

}


class LLHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}