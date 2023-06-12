import 'package:flutter/material.dart';

class GroupController extends InheritedWidget {
  GroupController({required super.child, super.key});

  final TextEditingController controller = TextEditingController();

  static GroupController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupController>();
  }

  static GroupController of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No GroupController found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(GroupController oldWidget) =>
      controller != oldWidget.controller;
}
