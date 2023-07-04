import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/api_client/api_client.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/data/remote/entity/love_response.dart';
import 'package:start_flutter/ui/main_navigation/main_navigation.dart';

class LoveHomeModel extends ChangeNotifier {
  final apiClient = ApiClient();
  LoveResponse? result;

  Future<void> toResult(
      {required BuildContext context,
      required String firstName,
      required String secondName}) async {
    result =
        await apiClient.getLove(firstName: firstName, secondName: secondName);
    notifyListeners();
    unawaited(Navigator.pushNamed(context, MainNavigationRoutesNames.loveCalculatorResult,
        arguments: result));
  }
}

class LoveHomeProvider extends InheritedNotifier {
  final LoveHomeModel model;

  const LoveHomeProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(child: child, notifier: model);

  static LoveHomeProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoveHomeProvider>();
  }

  static LoveHomeProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoveHomeProvider>()
        ?.widget;
    return widget is LoveHomeProvider ? widget : null;
  }
}
