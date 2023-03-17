import 'package:flutter/material.dart';
import 'viewmodel/counter_view_model.dart';
import 'package:provider/provider.dart';

/// 1. 创建自己需要的共享的数据
/// 2. 在应用程序的顶层ChangeNotifierProvider
/// 3. 在其他位置使用共享的数据
///    > Provider.of: 当Provider中的数据发生改变时,Provider.of所在的Widget整个build方法都会重新构建
///    > Consumer(相对推荐): 当Provider中的数据发生改变时，执行重新执行Consumer的builder
///    > Selector: 1. selector方法(作用：对原有的数据进行转换) 2.shouldRebuild(作用：要不要重新构建)

void main(){
  runApp(
    // 2.在应用程序的顶层ChangeNotifierProvider
    ChangeNotifierProvider(
        create: (ctx) => LLCounterViewModel(),
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue, splashColor: Colors.transparent
          ),
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
          children: <Widget>[
            LLShowData01(),
            LLShowData02()
          ],
        ),
      ),
      floatingActionButton: Selector<LLCounterViewModel , LLCounterViewModel>(
        selector: (ctx, counterVN){
          return counterVN;
        },
        shouldRebuild: (prev, next) {
          return false;
        },
        builder: (ctx , counterVM , child){
          print("floatingActionButton build方法被执行");
          return FloatingActionButton(
              child: child,
              onPressed: (){
                counterVM.counter += 1;
              }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LLShowData01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 3. 在其他位置使用共享的数据
    int counter = Provider.of<LLCounterViewModel>(context).counter;
    print("data01的build方法");

    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          LLShowData02(),
          Text("当前计数: $counter",style: const TextStyle(fontSize: 30),),
        ],
      ),
    );
  }
}

class LLShowData02 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      print("data02的build方法");
      return Container(
        color: Colors.red,
        child: Consumer<LLCounterViewModel>(
          builder: (ctx , counterVM , child){
            print("data02 Consumer build方法被执行");
            return Text("当前计数：${counterVM.counter}", style: const TextStyle(fontSize: 30),);
          },
        ),
      );
  }
}

