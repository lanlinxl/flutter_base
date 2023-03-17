
/**
 * https://www.modb.pro/db/324185
 * Future使用总结：
 * 1.创建一个Future（可能是我们创建的，也可能是调用内部API或者第三方API获取到的一个Future，总之你需要获取到一个Future实例，Future通常会对一些异步的操作进行封装）
 * 2.通过.then（成功回调函数）的方式来监听Future内部执行完成时获取到的结果
 * 3.通过.catchError(失败或异常回调函数)的方式来监听Future内部执行失败或者出现异常时的错误信息
 *
 * Future的两种状态：
 * 1. 状态一：未完成状态（uncompleted）执行Future内部的操作时（在上面的案例中就是具体的网络请求过程，我们使用了延迟来模拟），我们称这个过程为未完成状态
 * 2. 状态二：完成状态（completed）当Future内部的操作执行完成，通常会返回一个值，或者抛出一个异常
 *
 * Future的链式调用
 * 我们可以在then中继续返回值，会在下一个链式的then调用回调函数中拿到返回的结果
 *
 * Future其他API：
 * 1. Future.value(value) 直接获取一个完成的Future，该Future会直接调用then的回调函数
 * 2. Future.error(object) 直接获取一个完成的Future，但是是一个发生异常的Future，该Future会直接调用catchError的回调函数
 * 3. Future.delayed(时间, 回调函数) 在延迟一定时间时执行回调函数，执行完回调函数后会执行then的回调；
 */

import 'dart:math';
import 'dart:io';
import "dart:async";

void main() {
  // print("main function start");
  // // 1. Future的基本使用
  // var future = getNetworkData1();
  // future.then((value) {
  //   print(value);
  // }).catchError((error){ // 捕获异常情况
  //   print(error);
  // });
  // // 为什么立即执行，但是"哈哈哈" 是在最后打印的呢？
  // // 这是因为Future中的then会作为新的任务会加入到事件队列中（Event Queue），加入之后你肯定需要排队执行了
  // Future.value("哈哈哈").then((value) {
  //   print(value);
  // });
  //
  // // =============== async 、 await =============
  // var future1 = getNetworkData2();
  // future1.then((value) {
  //   print(value);
  // }).catchError((error){ // 捕获异常情况
  //   print(error);
  // });
  // print("main function end");
  testSequence();
}

// Future
Future<String> getNetworkData1(){
  return Future<String>(() {
    sleep(Duration(seconds: 2));
    if (Random().nextBool()){
      return "正常结果返回";
    }else {
      throw Exception("网络请求出错");
    };
  });
}

// async 、 await
Future<String> getNetworkData2() async {
  var result = await Future.delayed(Duration(seconds: 3),(){
    if (Random().nextBool()){
      return "正常结果返回";
    }else {
      throw Exception("网络请求出错");
    };
  });
  return "请求到的数据：" + result;
}

// 小测试
void testSequence(){
  print("main start");
  Future(() => print("task1"));
  final future = Future(() => null);

  Future(() => print("task2")).then((_) {
    print("task3");
    scheduleMicrotask(() => print("task4"));
  }).then((_) => print("task5"));

  future.then((_) => print("task6"));
  scheduleMicrotask(() => print("task7"));

  Future(() => print('task8'))
      .then((_) => Future(() => print('task9')))
      .then((_) => print('task10'));

  print("main end");
   // 7、1、2 、3、4、5、8、9、10
}
