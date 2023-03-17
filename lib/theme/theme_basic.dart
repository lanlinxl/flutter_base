import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 1.一旦设置了主题, 那么应用程序中的某些Widget, 就会直接使用主题的样式
     * 2.可以通过Theme.of(context).textTheme.display2
     */
    return MaterialApp(
      title: 'Flutter Demo',
      // 全局主题
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(secondary: Colors.green),
        buttonTheme: const ButtonThemeData(
          height: 25,
          minWidth: 10,
          buttonColor: Colors.yellow
        ),

        cardTheme: const CardTheme(
          color: Colors.greenAccent,
          elevation: 10
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: Colors.red),
          bodyLarge: TextStyle(fontSize: 20),

          displaySmall: TextStyle(fontSize: 14),
          displayMedium: TextStyle(fontSize: 16),
          displayLarge: TextStyle(fontSize: 20,color: Colors.black),
        ),
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
        title: const Text("首页")
      ),
      body: Center(
        child: Column(
          children: [
            Text("Hello World1"),
            Text("Hello World2", style: TextStyle(fontSize: 14),),
            Text("Hello World3", style: TextStyle(fontSize: 20),),
            Text("Hello World4", style: Theme.of(context).textTheme.bodyMedium),
            Text("Hello World5", style: Theme.of(context).textTheme.displayLarge,),
            Switch(value: true, onChanged: (value){ }),
            CupertinoSwitch(value: true, onChanged: (value){ }),
            FloatingActionButton(child: Text("Tttt"), onPressed: (){ }),
            Card(child: Text("你好啊，哈哈哈",style: TextStyle(fontSize: 40))),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "首页",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "分类",
              icon: Icon(Icons.category)
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
            return LLDetailPage();
          }));
        },
      ),

    );
  }
}

class LLDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 不使用全局主题色 单独定制一个主题色 使用Theme
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.purple),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("详情页"),
            backgroundColor: Colors.purple,
          ),

          body: Center(
            child: Text("detail page"),
          ),

          floatingActionButton: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: Colors.pink
              )
            ),
            child: FloatingActionButton(
              child: Icon(Icons.pets),
              onPressed: (){
              },
            ),
          ),
        )
    );
  }
}