import 'dart:developer';

import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_cli/cli/edit_node.dart';
import 'package:open_ai_cli/quick_app.dart';
import 'package:open_ai_cli/ui/default_input_decoration.dart';
import 'package:open_ai_cli/ui/style.dart';
// import 'package:open_ai_cli/style/style.dart';
import 'cli/account_node.dart';
import 'cli/cli.dart';
import 'cli/completion_node.dart';
import 'cli/readme.dart';
import 'openai_cli_generator.dart';


Future<void> main() async {

  //ensure flutter widget binding
  WidgetsFlutterBinding.ensureInitialized();
  CLIController controller = CLIController();
  controller.input.inputDecoration = cliDefaultTextDecoration;
  controller.input.textStyle = oacInputTextStyle;


  OpenAICLI openAICLI = await openAiCLIGenerator(controller);

/// listen to input
  controller.input.onSubmit.listen(openAICLI.scope.interpret);
  controller.input.onChange.listen(openAICLI.scope.listenToChange);


///set screen content
  controller.screen.content = [controller.display.widget, controller.input.widget];
  openAICLI.loadScreen();




  runApp(QuickApp(
      page: QuickPage(
        body: controller.screen.widget,
  )));
}

