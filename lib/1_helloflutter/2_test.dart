import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("小练习"),
      ),
      body: ContentBody(),
    );
  }
}


class ContentBody extends StatefulWidget {
  @override
  State<ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {
  var number = 0;
  
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: 
      Column(
        children: [
          Text("数字：$number",style: const TextStyle(fontSize: 20),),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                child: const Icon(Icons.add),
                  onPressed: (){
                  setState(() {
                    number += 1;
                  });
                }
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Icon(Icons.remove),
                  onPressed: (){
                    setState(() {
                      number -= 1;
                    });
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}