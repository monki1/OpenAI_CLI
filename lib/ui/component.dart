import 'package:flutter/cupertino.dart';

Widget gestureWidget(Widget widget, {Function()? onTap, Function()? onSwipeRight, Function()? onSwipeLeft, Function()? onDoubleTap, Function()? onLongPress, Color? color}){
  return GestureDetector(

    onTap: onTap,
    onDoubleTap: onDoubleTap,
    onLongPress: onLongPress,
    onHorizontalDragEnd: (details){
      if(details.velocity.pixelsPerSecond.dx > 0){
        onSwipeRight?.call();
      }else{
        onSwipeLeft?.call();
      }
    },
    child: widget,
  );
}
