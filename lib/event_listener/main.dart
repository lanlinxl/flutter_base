import 'package:flutter/material.dart';
import 'event_bus.dart';

///EventBus的使用方法 ===== 有点类似监听机制

/// 1. 创建全局的EventBus对象
class UserInfo {
  String nickname;
  int level;
  UserInfo(this.nickname,this.level);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter Demo',
       theme: ThemeData(primarySwatch: Colors.blue,splashColor: Colors.transparent),
       home: LLHomePage(),
     );
  }
}

class LLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("列表测试"),
       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             LLButton(),
             LLText(),
           ],
         ),
       ),
     );
  }
}

class LLButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialButton(
       child: Text("按钮"),
       onPressed: (){
           /// 2.发出事件
           final info = UserInfo("coderwhy", 18);
           eventBus.fire(info);
       }
     );
  }
}

class LLText extends StatefulWidget {
  @override
  State<LLText> createState() => _LLTextState();
}

class _LLTextState extends State<LLText>{
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();
    /// 3. 监听事件的类型  这里指定接收的类型为：UserInfo
    eventBus.on<UserInfo>().listen((data) {
      print(data.nickname);
      print(data.level);
      setState(() {
        _message = "${data.nickname} - ${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message,style: const TextStyle(fontSize: 20),);
  }

}











