


import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/ui/component.dart';
import 'package:open_ai_cli/ui/style.dart';

Widget headerWidget(String s, Function f){
  List<Widget> header = [Text("<<", style: headerTextStyle,),  Text(s, style: headerTextStyle,), Text("<<", style: headerTextStyle,)];
  Widget w = Container(
      // margin: EdgeInsets.all(2),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: headerBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: header,)
  );
  return gestureWidget(w, onTap: (){f();});
}