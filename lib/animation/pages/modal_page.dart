import 'package:flutter/material.dart';

class LLModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Modal Page"),
      ),
      body: Center(
        child: Text("Modal Page"),
      ),
    );
  }
}
