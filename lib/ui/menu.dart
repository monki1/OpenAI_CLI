


import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/ui/component.dart';
import 'package:open_ai_cli/ui/style.dart';

Widget menuWidget(String s, Function f){
  Widget w = Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(5),
    decoration: menuBoxDecoration,
    child: Text(s, style: menuTextStyle,)
  );
  return gestureWidget(w, onTap: (){f();});
}