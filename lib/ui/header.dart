


import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/ui/component.dart';
import 'package:open_ai_cli/ui/style.dart';

Widget headerWidget(String s, Function f){
  Widget w = Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: headerBoxDecoration,
      child: Text(s, style: headerTextStyle,)
  );
  return gestureWidget(w, onTap: (){f();});
}