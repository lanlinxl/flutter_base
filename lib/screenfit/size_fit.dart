import 'dart:ui';

class LLSizeFit{
  // 1.基本信息
  // 物理宽度分辨率
  static late double physicalWidth;
  // 物理高度分辨率
  static late double physicalHeight;
  // 屏幕宽度
  static late double screenWidth;
  // 屏幕高度
  static late double screenHeight;
  static late double dpr;
  // 状态栏高度
  static late double statusHeight;

  static late double rpx;
  static late double px;

  static void initialize({double standardSize = 750} ){
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    print("分辨率 physicalWidth:$physicalWidth ,physicalHeight:$physicalHeight");

    // 2.获取dpr
    dpr = window.devicePixelRatio;
    print("devicePixelRatio: $dpr");


    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;
    print("statusHeight: $statusHeight");

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    px = (screenWidth * 2) / standardSize ;
    print("rpx: $rpx ,px: $px");
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

extension DoubleFit on double {
  double get px {
    return LLSizeFit.setPx(this);
  }

  double get rpx {
    return LLSizeFit.setRpx(this);
  }
}

extension IntFit on int {
  double get px {
    return LLSizeFit.setPx(toDouble());
  }

  double get rpx {
    return LLSizeFit.setRpx(toDouble());
  }
}