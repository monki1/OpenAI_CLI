import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';
import 'package:open_ai_cli/ui/menu.dart';


class OpenAICLI extends CLI{
  String exitCode = CLIRegexHelper.exit;
  OpenAICLI(super.controller);
  @override
  interpret(String s)async{
    if(s.isEmpty){return rootScreen();}

    super.interpret(s);
  }


  @override
  void rootScreen() {
    List<Widget> wlst = [

    menuWidget("- completion", (){interpret("completion:");}),
    menuWidget("- edit", (){interpret("edit:");}),
      menuWidget("  account", (){interpret("account:");}),
      menuWidget("  readme", (){interpret("readme:");}),

    ];

    super.controller.screen.content = [controller.display.widget, controller.input.widget];
    controller.display.content = wlst;
  }

  @override
  bool _topInterpreter(String s){
    if(CLIRegexHelper.releaseScopeCommands.contains(s) || s == exitCode){

      rootScreen();
      return true;
    }
    return false;
  }
}




//regex helper
