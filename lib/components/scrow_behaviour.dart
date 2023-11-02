import 'package:flutter/cupertino.dart';

class RemoveScrollBubbleBehavior extends ScrollBehavior {
  @override
  Widget build(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}