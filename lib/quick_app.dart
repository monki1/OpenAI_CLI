import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickApp extends StatelessWidget {
  StatelessWidget page;
  ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    ),
  );
  QuickApp({required this.page ,super.key, ThemeData? theme_}){
    if(theme_ != null){
      this.theme = theme;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: page,
    );
  }
}

class QuickPage extends StatelessWidget{
  Widget body;
  QuickPage({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      )
    );
  }

}
