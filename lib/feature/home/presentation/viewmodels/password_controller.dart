import 'package:flutter/material.dart';

class PasswordController extends InheritedWidget {
  PasswordController({required super.child, super.key});

  final TextEditingController controller = TextEditingController();

  static PasswordController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PasswordController>();
  }

  static PasswordController of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No PasswordController found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PasswordController oldWidget) =>
      controller != oldWidget.controller;
}
