import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class LLCounterWidget extends InheritedWidget{
  // 1. 共享的数据
  final int counter;

  // 2. 定义构造方法
  const LLCounterWidget(this.counter , Widget child, {super.key}): super(child: child);

  // 3. 获取组件最近的当前InheritedWidget
  static LLCounterWidget? of(BuildContext context){
    // 沿着Element树，去找到最近的CounterElement 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.决定要不要回调State中的didChangeDependencies
  // 如果返回true： 执行依赖当前的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true ;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: LLHomePage(),
    );
  }
}


class LLHomePage extends StatefulWidget {
  const LLHomePage({super.key});
  @override
  State<LLHomePage> createState() => _LLHomePageState();
}

class _LLHomePageState extends State<LLHomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
      ),
      body: LLCounterWidget(
        _counter,
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              LLShowData01(),
              LLShowData02()
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class LLShowData01 extends StatefulWidget {
  const LLShowData01({super.key});
  @override
  State<LLShowData01> createState() => _LLShowData01State();
}

class _LLShowData01State extends State<LLShowData01> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行了_LLShowData01State中的didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int? counter = LLCounterWidget.of(context)?.counter;

    return Container(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: const TextStyle(fontSize: 30),),
    );
  }
}

class LLShowData02 extends StatefulWidget {
  const LLShowData02({super.key});

  @override
  State<LLShowData02> createState() => _LLShowData02State();
}

class _LLShowData02State extends State<LLShowData02> {
  @override
  Widget build(BuildContext context) {
    int? counter = LLCounterWidget.of(context)?.counter;

    return Container(
      color: Colors.red,
      child: Text("当前计数: $counter", style: const TextStyle(fontSize: 30),),
    );
  }
}