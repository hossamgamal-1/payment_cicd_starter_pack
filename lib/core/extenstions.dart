import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void push(Widget screen) {
    final route = MaterialPageRoute(builder: (_) => screen);
    Navigator.of(this).push(route);
  }

  void pop() => Navigator.of(this).pop();

  void pushReplacement(Widget screen) {
    final route = MaterialPageRoute(builder: (_) => screen);
    Navigator.of(this).pushReplacement(route);
  }
}
