import 'package:flutter/material.dart';
/// =========== 滑动组件 =============

class MyListView extends StatelessWidget {
      final TextStyle textStyle = TextStyle(fontSize: 20 , color: Colors.redAccent);

      @override
      Widget build(BuildContext context){
        return ListView(
          children: <Widget>[
             Padding(
               padding: EdgeInsets.all(8),
               child: Text("啦啦啦啦啦啦",style: textStyle),
             ),
            Padding(
              padding:  EdgeInsets.all(8),
              child: Text("哈哈哈哈啊哈哈哈",style: textStyle),
            ),
            Padding(
              padding:  EdgeInsets.all(8),
              child: Text("嘻嘻嘻嘻嘻嘻嘻嘻",style: textStyle),
            ),
          ],
        );
      }
}


/*
GridView构造函数
一种使用GridView的方式就是使用构造函数来创建，和ListView对比有一个特殊的参数：gridDelegate
gridDelegate用于控制交叉轴的item数量或者宽度，需要传入的类型是SliverGridDelegate，但是它是一个抽象类，所以我们需要传入它的子类：
SliverGridDelegateWithFixedCrossAxisCount({
  @requireddouble crossAxisCount, // 交叉轴的item个数
  double mainAxisSpacing = 0.0, // 主轴的间距
  double crossAxisSpacing = 0.0, // 交叉轴的间距
  double childAspectRatio = 1.0, // 子Widget的宽高比
})
*/
class MyGridCountDemo extends StatelessWidget {
     List<Widget> getFridWidgets(){
       return List.generate(100, (index) {
         return Container(
           color: Colors.purple,
           alignment: Alignment(0,0),
           child: Text("item$index",style: TextStyle(fontSize:20,color: Colors.white ),),
         );
       });
     }

     @override
     Widget build(BuildContext context) {
       return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 3,
         mainAxisExtent: 100,
         mainAxisSpacing: 10,
         crossAxisSpacing: 10,
         childAspectRatio: 1.0
       ),
       children: getFridWidgets(),
       );
     }
}



/*
Flutter中有一个可以完成这样滚动效果的Widget：CustomScrollView，可以统一管理多个滚动视图。
在CustomScrollView中，每一个独立的，可滚动的Widget被称之为Sliver。
* Slivers的基本使用
因为我们需要把很多的Sliver放在一个CustomScrollView中，所以CustomScrollView有一个slivers属性，里面让我们放对应的一些Sliver：
  SliverList：类似于我们之前使用过的ListView；
  SliverFixedExtentList：类似于SliverList只是可以设置滚动的高度；
  SliverPadding：设置Sliver的内边距，因为可能要单独给Sliver设置内边距；
  SliverAppBar：添加一个AppBar，通常用来作为CustomScrollView的HeaderView；
  SliverSafeArea：设置内容显示在安全区域（比如不让齐刘海挡住我们的内容）
**/

class SliverEasyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(sliver:
           SliverPadding(
             padding: EdgeInsets.all(8),
             sliver: SliverGrid(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 8,
                 mainAxisSpacing: 8,
               ),
               delegate:  SliverChildBuilderDelegate(
                   (BuildContext context, int index){
                     return Container(
                       alignment: Alignment(0,0),
                       color: Colors.orange,
                       child: Text("item$index"),
                     );
                   },
                 childCount: 20
               ),
             ),
           ),
        )
      ],
    );
  }
}

/*
* 复杂结构视图的demo
* */
class SliversDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showCustomScrollView();
  }

  Widget showCustomScrollView() {
      return CustomScrollView(
        slivers: <Widget>[
          // 1.顶部背景图
          showSliverAppBar(),

          // 2.网格列表
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),

            delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
             },
             childCount:  10,
            ),
          ),

           // 3.视图列表
           SliverFixedExtentList(
             itemExtent: 50,
             delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
               return Container(
                 alignment: Alignment.center,
                 color: Colors.lightBlue[100 * (index % 9)],
                 child: Text('list item $index'),
               );
             },
               childCount: 20,
             ),
           ),
        ],
      );
  }

  Widget showSliverAppBar(){
      return SliverAppBar(
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
          title: Text("负责结构视图"),
          background: Image(image:
              NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
              fit: BoxFit.cover,
          ),
        ),
      );
  }
}

/*
* 监听滚动事件
* */

class ScrollviewWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ScrollviewState();
}

class ScrollviewState extends State<ScrollviewWidget> {
   ScrollController _controller = ScrollController();
   bool _isShowTop = false;

   @override
   void initState(){
     _controller.addListener(() {
       var tempSsShowTop = _controller.offset >= 1000;
       if (tempSsShowTop != _isShowTop){
            setState((){
              _isShowTop = tempSsShowTop;
            });
       }
     });
       super.initState();
   }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text("ListView 展示"),
         ),
         body: ListView.builder(
             itemExtent: 60,
             itemCount: 100,
             controller:  _controller,
             itemBuilder: (BuildContext context, int index){
               return ListTile(title: Text("item$index"),);
               }
             ),
         floatingActionButton: !_isShowTop ? null : FloatingActionButton(
           child: Icon(Icons.arrow_upward),
           onPressed: (){
            _controller.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
         },
         ),
       );
   }
}










