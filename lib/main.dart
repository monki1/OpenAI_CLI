import 'dart:developer';

import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_cli/cli/edit_node.dart';
import 'package:open_ai_cli/cli/readme.dart';
import 'package:open_ai_cli/quick_app.dart';
import 'package:open_ai_cli/ui/style.dart';
// import 'package:open_ai_cli/style/style.dart';
import 'cli/account_node.dart';
import 'cli/cli.dart';
import 'cli/completion_node.dart';


Future<void> main() async {

  //ensure flutter widget binding
  WidgetsFlutterBinding.ensureInitialized();
  CLIController controller = CLIController();
  controller.input.textStyle = oacInputTextStyle;


  OpenAICLI openAICLI = await initOpenAICLI(controller);

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

Future<OpenAICLI> initOpenAICLI(CLIController controller) async {
  OpenAICLI openAICLI = OpenAICLI(controller);
  AccountNode accountNode = AccountNode(AccountFunctionNode());
  CompletionNode completionNode = CompletionNode(CompletionFunctionNode());
  EditNode editNode = EditNode(EditFunctionNode());
  ReadMeNode readMeNode = ReadMeNode();

  openAICLI.add(accountNode);
  openAICLI.add(completionNode);
  openAICLI.add(editNode);
  openAICLI.add(readMeNode);

  return openAICLI;

}
