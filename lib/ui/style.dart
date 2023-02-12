// import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class OpenAICLIPromptTextStyle extends TextStyle{
//   OpenAICLIPromptTextStyle({Color? color, double? fontSize, String? fontFamily, double? height, double? letterSpacing,
//   double? wordSpacing, double? textBaseline, double? heightMultiplier, double? leadingDistribution, TextDecoration?
//   decoration, Color? decorationColor, TextDecorationStyle? decorationStyle, double? decorationThickness, String? debugLabel,
//   TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? fontFamilyFallback, List<String>?
// }

TextStyle openAICLIPromptTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.lightBlue,
);
TextStyle openAICLIOutputTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
);
TextStyle oacInputTextStyle = TextStyle(
  fontSize: 23,
  color: Colors.white,
);
TextStyle menuTextStyle = TextStyle(
  fontSize: 29,
  color: Colors.white,
);
TextStyle headerTextStyle = TextStyle(
  fontSize: 29,
  color: Colors.white,
);

BoxDecoration menuBoxDecoration = BoxDecoration(
  border: Border.all(
    color: Colors.white,
    width: 2,
  ),

);
BoxDecoration headerBoxDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(
      color: Colors.white,
      width: 2,
    ),
  ),



);

Widget oacPromptWidget(String s) {
  return SelectableText(
    s,
    style: openAICLIPromptTextStyle,
  );
}
Widget oacOutputWidget(String s) {
  return SelectableText(
    s,
    style: openAICLIOutputTextStyle,
  );
}




