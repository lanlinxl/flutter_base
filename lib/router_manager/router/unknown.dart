import 'package:flutter/material.dart';

class LLUnknownPage extends StatelessWidget{
  static const String routeName = "/unknown";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("错误页面"),
      ),
      body: const Center(
        child: const Text("错误页面",style: TextStyle(fontSize:20 ,color: Colors.red ),),
      ),
    );
  }

}