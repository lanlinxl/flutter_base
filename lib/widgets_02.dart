import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
/// =========== 布局组件 =============

/// Align
class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return const Align(
      child: Icon(Icons.pets,size: 36,color: Colors.red),
      alignment: Alignment.center,
      widthFactor: 4,
      heightFactor: 4,
    );
  }
}

/// Padding
class MyPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: EdgeInsets.all(100),
        child: Text(
          "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 18
          ),
        ),
    );
  }
}

/// Container
class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Center(
       child: Container(
         padding: EdgeInsets.all(20),
         color: Color.fromRGBO(3, 3, 255, .5),
         width: 100,
         height: 100,
         child: Icon(Icons.pets , size: 32, color: Colors.red),
       ),
     );
  }
}


class MyBoxDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        ///使用BoxDecoration 就不能使用color属性
        // color: Color.fromRGBO(3, 3, 255, .5),
        width: 150,
        height: 150,
        child: Icon(Icons.pets , size: 32, color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.red,
          // 边框
          border: Border.all(
            color: Colors.black,
            width: 1,
            style: BorderStyle.solid
          ),
          // 圆角
          borderRadius: BorderRadius.circular(75),
          //阴影
          boxShadow: [
            BoxShadow(
              offset: Offset(5,5),
              color: Colors.redAccent,
              blurRadius: 5
            ),
          ],
          // 渐变色 使用这个会覆盖color属性
          gradient:  LinearGradient(
            colors: [
              Colors.purple,
              Colors.purpleAccent
            ]
          )
        ),
      ),
    );
  }
}

/// Flex组件 ，row组件和Column组件都继承自Flex组件
/// Row组件
class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      //默认情况下，Row会尽可能占据多的宽度，让子Widget在其中进行排布，这是因为mainAxisSize属性默认值是MainAxisSize.max
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1, //弹性系数，Row会根据两个Expanded的弹性系数来决定它们占据剩下空间的比例
            child: Container(color: Colors.red,width: 60,height: 60)
        ),
        Container(color: Colors.blue,width: 80,height: 80),
        Container(color: Colors.purpleAccent,width: 70,height: 70),
        Expanded(
            flex: 1,
            child: Container(color: Colors.black,width: 100,height: 100)
        ),
      ],
    );
  }
}

/// Column组件
class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1, //弹性系数，Row会根据两个Expanded的弹性系数来决定它们占据剩下空间的比例
            child: Container(color: Colors.red,width: 60,height: 60)
        ),
        Container(color: Colors.blue,width: 80,height: 80),
        Container(color: Colors.purpleAccent,width: 70,height: 70),
        Expanded(
            flex: 1,
            child: Container(color: Colors.black,width: 100,height: 100)
        ),
      ],
    );
  }
}

/// Stack组件
class MyStack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Stack(
          children: [
            Container(
              color: Colors.purple,
              width: 300,
              height: 300,
            ),

            Positioned(
                top: 20,
                left: 20,
                child: Icon(Icons.favorite,size: 50,color: Colors.white)
            ),

            Positioned(
                bottom: 20,
                right: 20,
                child: Text("啦啦啦啦",style: TextStyle(fontSize: 14,color: Colors.red),)
            )
          ],
        ),
      );
  }
}