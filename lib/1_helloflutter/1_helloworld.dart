import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: "第一个flutter程序",
       home: MyHomePage(),
     );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter程序") ,
      ),

      body: const Center(
        child: Text("哈哈哈哈哈",style: TextStyle(fontSize: 20,color: Colors.red),),
      ),
    );
  }
}
