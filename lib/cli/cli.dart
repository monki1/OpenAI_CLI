import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/ui/menu.dart';

import '../regex_helper.dart';


class OpenAICLI extends CLI{
  String exitCode = CLIRegexHelper.exit;
  OpenAICLI(CLIController controller_) : super(controller_);


  @override
  loadScreen() {
    List<Widget> header = [];
    if(releaseParentScope != null){
      header.add(menuWidget("open ai cli", (){releaseParentScope!();}));
    }
    List<Widget> wlst = header + [

    menuWidget("- completion", (){interpret("completion:");}),
    menuWidget("- edit", (){interpret("edit:");}),
      menuWidget("  account", (){interpret("account:");}),
      menuWidget("  readme", (){interpret("readme:");}),

    ];

    super.controller.screen.content = [controller.display.widget, controller.input.widget];
    controller.display.content = wlst;
  }


}


