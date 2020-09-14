import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool featureItemMatcher(Widget widget, String name, IconData icon) {
  if (widget is FeatureItem) {
    return widget.name == 'Transfer' && widget.icon == Icons.monetization_on;
  }
  return false;
}