import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  // test1练习
  // runApp(MyApp());
  print("main function start");

  var future = getNetworkData();
  future.then((value) {
    print(value);
  }).catchError((error){ // 捕获异常情况
    print(error);
  });
  print("main function end");
}

Future<String> getNetworkData(){
  return Future<String>(() {
    // return "111111";
    throw Exception("网络请求出错");
  });
}


/// 使用http进行网络请求
void getRequest() async {
  var url = Uri.parse('http://123.207.32.32:8000/home/multidata');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}


// void decodeJson() async {
//   // 1.读取json文件
//    var jsonString = await rootBundle.loadString("assets/test.json");
// // 2.转成List或Map类型
// //   final jsonResult = json.decode(jsonString);
//   print('decodeJson status: ${jsonString}');
// }
