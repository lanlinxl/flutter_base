import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage() ,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第1111个Flutter程序"),
        ),
        body: ContentBody()
    );
  }
}

class ContentBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        SizedBox(height: 20),
        Item("标题1", "嘻嘻嘻嘻嘻嘻嘻嘻", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 10),
        Item("标题2", "哈哈哈哈哈", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 10),
        Item("标题3", "啦啦啦啦啦啦啦", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 30),
      ],
    );
  }
}

class Item extends StatelessWidget{
  final String title;
  final String desc;
  final String imageURL;

  final style1 = TextStyle(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold);
  final style2 = TextStyle(fontSize: 14,color: Colors.blue);

  Item(this.title,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color: Colors.pink
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,style: style1)
            ],
          ),
          SizedBox(height: 8),
          Text(desc,style: style2),
          SizedBox(height: 8),
          Image.network(imageURL),
        ],
      ),
    );
  }
}

