import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/state_manager/inheritedwidget_basic.dart';
import 'package:flutterdemo/state_manager/model/user_info.dart';
import 'package:flutterdemo/state_manager/viewmodel/counter_view_model.dart';
import 'package:flutterdemo/state_manager/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

import 'viewmodel/initialize_providers.dart';


/// 共享多个Provider模型数据
/// 方法一：不断嵌套
// void main(){
//   runApp(
//     // 2. 在应用程序的顶层ChangeNotifierProvider
//     ChangeNotifierProvider(
//       create: (ctx) => LLCounterViewModel(),
//       child: ChangeNotifierProvider(
//         create: (ctx) => LLUserViewModel(UserInfo('1',10,'22')),
//         child: MyApp(),
//       ),
//     ),
//   );
// }

/// 方法二：使用MultiProvider

void main(){
  runApp(
    MultiProvider(
        providers: customProviders,
        child: MyApp(),
    )
  );
  
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter Demo',
       theme: ThemeData( primarySwatch: Colors.blue, splashColor: Colors.transparent ),
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
            LLShowData02(),
            LLShowData03(),
          ],
        ),
      ),

      floatingActionButton: Selector<LLCounterViewModel,LLCounterViewModel>(
        selector: (ctx, counterVM) => counterVM,
        shouldRebuild: (prev, next) => false,
        builder: (ctx, counterVM, child) {
          print("floatingActionButton build方法被执行");
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterVM.counter += 1;
            },
          );
        },
      )


    );
  }
}


class LLShowData01 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<LLCounterViewModel>(context).counter;
    print("执行LLShowData01方法");

    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text("当前计数: $counter",style: const TextStyle(fontSize: 30),),
        ],
      ),
    );
  }

}

class LLShowData02 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("执行LLShowData02方法");

    return Container(
      color: Colors.red,
      child: Consumer<LLCounterViewModel>(
        builder: (ctx , counterVM , child){
          print("LLShowData02 Consumer builder方法被执行");
          return Text("当前计数: ${counterVM.counter}",style:const TextStyle(fontSize: 30),);
        },
      ),
    );
  }
}


class LLShowData03 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Consumer2<LLUserViewModel,LLCounterViewModel>(
         builder: (ctx, userVM, counterVM , child){
           print("nickname: ${userVM.user.nickname} counter: ${counterVM.counter}");
           return Text("nickname: ${userVM.user.nickname} counter: ${counterVM.counter}",style:const TextStyle(fontSize: 30),);
         }
     );
  }
}