import 'package:flutter/material.dart';

extension MyExtenTions on BuildContext {
  get screenSize => MediaQuery.of(this).size;
  get bodyMargin10 => screenSize.width / 10;
  get customTheme => Theme.of(this);
}
