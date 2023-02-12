import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';
import 'package:open_ai_cli/ui/menu.dart';


class OpenAICLI extends CLI{
  OpenAICLI(super.controller){
    scope.top = _scopeTop;

  }
  @override
  void interpret(String s){
    if(s.isEmpty){return rootScreen();}

    super.interpret(s);
  }


  @override
  void rootScreen() {
    List<Widget> wlst = [
    menuWidget("readme", (){interpret("readme:");}),
    menuWidget("account", (){interpret("account:");}),
    menuWidget("completion", (){interpret("completion:");}),
    menuWidget("edit", (){interpret("edit:");}),
    ];

    controller.screen.content = [controller.display.widget, controller.input.widget];
    controller.display.content = wlst;
  }


  bool _scopeTop(String s){
    if(CLIRegexHelper.releaseScopeCommands.contains(s)){
      scope.release();
      rootScreen();
      return true;
    }
    return false;
  }
}




//regex helper
