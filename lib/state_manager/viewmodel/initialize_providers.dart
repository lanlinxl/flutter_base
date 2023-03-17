import 'package:flutterdemo/state_manager/model/user_info.dart';
import 'package:flutterdemo/state_manager/viewmodel/counter_view_model.dart';
import 'package:flutterdemo/state_manager/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;


List<SingleChildWidget> customProviders = [
  ChangeNotifierProvider(create: (ctx) => LLCounterViewModel()),
  ChangeNotifierProvider(create: (ctx) => LLUserViewModel(UserInfo('why',29,'abc'))),
];