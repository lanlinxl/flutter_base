import 'package:flutter/material.dart';

import '../router_main.dart';
import '../about.dart';
import '../detail.dart';
import 'package:flutterdemo/router_manager/router/unknown.dart';

class LLRouter {
  static final Map<String ,WidgetBuilder> routes = {
    LLHomePage.routeName: (ctx) => LLHomePage(),
    LLAboutPage.routeName: (ctx) => LLAboutPage()
  };

  static String get initialRoute => LLHomePage.routeName;

  static RouteFactory generateRoute = (settings) {
    if (settings.name == LLDetailPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return LLDetailPage("/detail");
          }
      );
    }
    return null;
  };

  static RouteFactory get unknownRoute => (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return LLUnknownPage();
        }
    );
  };

}