import 'package:flutter/material.dart';

class LLDetailPage extends StatelessWidget {
  static const String routeName = "LLDetailPage";
  final String _meesage;

  LLDetailPage(this._meesage);

  @override
  Widget build(BuildContext context) {
     return WillPopScope(
       // 当返回为true时，可以自动返回(flutter帮助我门执行返回操作)
       // 当返回为false时，自行写返回代码
       onWillPop: (){
         _backToHome(context);
         return Future.value(false);
       },
       
       child: Scaffold(
         appBar: AppBar(
           title:const Text("详情页"),
          // leading: IconButton(onPressed: () => _backToHome(context), icon:const Icon(Icons.arrow_back)),

         ),
         
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(_meesage,style: TextStyle(fontSize: 20),),
               MaterialButton(
                 child: const Text("回到首页"),
                   onPressed: () => _backToHome(context),
               ),
             ],
           ),
         ),
       ),
     );
  }
  
  void _backToHome(BuildContext context){
    Navigator.of(context).pop("a detail message");
  }

}