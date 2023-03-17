import 'package:flutter/material.dart';
/// =========== 文本输入等组件 =============
/// 普通文本
class MyText extends StatelessWidget {
  String text = "";
  MyText(this.text);
  @override
  Widget build(BuildContext context){
    return Text(text,
          style: TextStyle(fontSize: 20 ,color: Colors.purple),
          maxLines: 10,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
     );
  }
}
/// 富文本
class MyRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: "定风波",style: TextStyle(fontSize: 25,color: Colors.purple)),
        TextSpan(text: "苏苏",style: TextStyle(fontSize: 14,color: Colors.red)),
        TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生"),
      ],
      ),
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 18,color: Colors.amberAccent),
    );
  }
}
/// 按钮
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
            child:Text("FloatingActionButton") ,
            onPressed: (){
               print("FloatingActionButton Click");
          },
        ),

        MaterialButton(
            child: Text("MaterialButton"),
            onPressed: (){
              print("MaterialButton Click");
            },
        ),

        // FlatButton(
        //   child: Text("FlatButton"),
        //   onPressed: () {
        //     print("FlatButton Click");
        //   },
        // ),
      ],
    );
  }
}
/// 图片（展示网络图片）
class MyImage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.network(
            "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.repeatY,
          color: Colors.red,
          colorBlendMode: BlendMode.colorDodge,
        ),
        width: 300,
        height: 300,
        color: Colors.yellow,
      ),
    );
  }
}
/// 图片（展示本地图片）
class MyImage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset("images/demo.png"),
        width: 300,
        height: 300,
        color: Colors.yellow,
      ),
    );
  }
}
/// 圆角头像1
class MyCircleAvatar extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Center(
       child: CircleAvatar(
         radius: 100,
         backgroundImage: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
         child: Container(
           alignment: Alignment(0 , 0.5),
           width: 200,
           height: 200,
           child: Text("兵长利威尔"),
         ),
       ),
     );
   }
}
/// 圆角头像2
class MyClipOval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
/// 圆角图片
class MyClipRRect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
/// TextField
class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: "username",
        hintText: "请输入用户名",
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.lightGreen
      ),
      onChanged: (value){
        print("onChanged: $value");
      },
      onSubmitted: (value){
        print("onChanged: $value");
      },
    );
  }
}




















