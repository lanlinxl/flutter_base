import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue,splashColor: Colors.transparent),
      home: LLHomePage(),
    );
  }
}

class LLHomePage extends StatefulWidget {
  @override
  State<LLHomePage> createState() => _LLHomePageState();
}

class _LLHomePageState extends State<LLHomePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _sizeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _sizeAnim = Tween(begin: 50.0,end: 150.0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _controller.reverse();
      }else if (status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("执行_HYHomePageState的build方法");
    return Scaffold(
      appBar: AppBar(title: const Text("首页"),),
      body: Center(child:
         AnimatedBuilder(
           animation: _controller,
           builder: (ctx, child){
             return Icon(Icons.favorite,color: Colors.red,size: _sizeAnim.value);
           },
         )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: (){
          if (_controller.isAnimating){
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

