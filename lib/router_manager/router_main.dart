import 'package:flutter/material.dart';
import 'package:flutterdemo/router_manager/about.dart';
import 'package:flutterdemo/router_manager/detail.dart';
import 'package:flutterdemo/router_manager/router/router.dart';
import 'package:flutterdemo/router_manager/router/unknown.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,splashColor: Colors.transparent
      ),
      routes: LLRouter.routes,
      initialRoute: LLRouter.initialRoute, // 默认展示的路由页面
      onGenerateRoute: LLRouter.generateRoute,//
      onUnknownRoute: LLRouter.unknownRoute,

      home: LLHomePage(),
    );
  }
}

class LLHomePage extends StatefulWidget{
  static const String routeName = "";

  @override
  State<LLHomePage> createState() => _LLHomePageState();
}

class _LLHomePageState extends State<LLHomePage> {
  String _homeMessage = "default message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("首页"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_homeMessage,style: TextStyle(fontSize: 20,color: Colors.red),),
            MaterialButton(
              child: const Text("跳转到详情"),
                onPressed: () => _jumpToDetail(context),
            ),
            MaterialButton(
              child:const Text("跳转到关于"),
              onPressed: () => _jumpToAbout(context),
            ),
            MaterialButton(
              child:const Text("跳转到详情"),
              onPressed: () => _jumpToDetail2(context),
            ),
            MaterialButton(
              child:const Text("跳转到设置"),
              onPressed: () => _jumpToSettings(context),
            ),
          ],
        ),
      ),
    );
  }

  void _jumpToDetail(BuildContext context){
    // 1.普通的跳转方式
    // 传递参数: 通过构造器直接传递即可
    Future result = Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) {
          return LLDetailPage("a home message");
        })
    );

    // 回调 ，接收上个页面返回的参数
    result.then((res) {
      setState(() {
        _homeMessage = res;
      });
    });
  }

  void _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed(LLAboutPage.routeName,arguments:"a home message" );
  }

  void _jumpToDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(LLDetailPage.routeName, arguments: "a home detail2 message");
  }

  void _jumpToSettings(BuildContext context) {
    Navigator.of(context).pushNamed(LLUnknownPage.routeName);
  }
}

