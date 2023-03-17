import 'package:flutter/material.dart';
import 'dart:async';

class LLAboutPage extends StatefulWidget {
  static const String routeName = "LLAboutPage";

  @override
  State<LLAboutPage> createState() => _LLAboutPageState();
}

class _LLAboutPageState extends State<LLAboutPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      final String message = ModalRoute.of(context)?.settings.arguments as String;
      print(message);
    });

    Timer.run(() {
      final String message = ModalRoute.of(context)?.settings.arguments as String;
      print(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            MaterialButton(
                child: Text('返回首页'),
                onPressed: (){
              Navigator.of(context).pop();
            }),
          ],
        ),
      ),
    );
  }
}