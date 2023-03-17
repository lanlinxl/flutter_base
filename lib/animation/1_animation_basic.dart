
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: "动画练习",
       theme: ThemeData(primarySwatch: Colors.blue,splashColor: Colors.transparent),
       home: LLHomePage(),
     );
  }
}

class LLHomePage extends StatefulWidget{
  @override
  State<LLHomePage> createState() => _LLHomePageState();
}

class _LLHomePageState extends State<LLHomePage>
     with SingleTickerProviderStateMixin {

  // 创建AnimationController
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation _sizeAnim;


  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    
    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller,curve: Curves.linear);
    
    // 3.Tween
    double myDoubleValue = 50.0;
    _sizeAnim = Tween(begin: myDoubleValue,end: myDoubleValue + 150.0).animate(_animation);

    // 监听动画值的改变
    _controller.addListener(() {
      setState(() { });
    });

    // 监听动画的状态改变
    _controller.addStatusListener((status) {
       if (status == AnimationStatus.completed) {
         _controller.reverse();
       }else if (status == AnimationStatus.dismissed){
         _controller.forward();
       }
    });
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("首页"),),
       body: Center(
         child: Icon(Icons.favorite,color: Colors.red,size: _sizeAnim.value),
       ),
       floatingActionButton: MaterialButton(
         child: const Icon(Icons.play_arrow),
         onPressed: () {
           if (_controller.isAnimating){
             _controller.stop();
             print(_controller.status);
           } else if (_controller.status == AnimationStatus.forward){
             _controller.forward();
           }else if (_controller.status == AnimationStatus.reverse){
             _controller.reverse();
           }else {
             _controller.forward();
           }
       }),
     );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}

/**
 *  1.Animation: 抽象类
 *    * 监听动画值的改变
 *    * 监听动画状态的改变
 *    * value
 *    * status
 *  2.AnimationController继承自Animation
 *    * vsync: 同步信号(this -> with SingleTickerProviderStateMixin)
 *    * forward(): 向前执行动画
 *    * reverse(): 反转执行动画
 *  3.CurvedAnimation:
 *    * 作用: 设置动画执行的速率(速度曲线)
 *  4.Tween: 设置动画执行的value范围
 *    * begin: 开始值
 *    * end: 结束值
 */