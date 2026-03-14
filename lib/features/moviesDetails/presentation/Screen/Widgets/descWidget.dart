import 'package:flutter/material.dart';
import 'package:movies/core/resources/styles_manager.dart';

class Descwidget extends StatelessWidget {
  String desc;
  Descwidget({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Text(desc, style: StylesManager.white16W400Roboto);
  }
}
