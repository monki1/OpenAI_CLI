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
  OpenAICLI openAICLI = OpenAICLI(controller);
  AccountNode accountNode = AccountNode();
  CompletionNode completionNode = CompletionNode();
  EditNode editNode = EditNode();
  ReadMeNode readMeNode = ReadMeNode();

  openAICLI.add(accountNode);
  openAICLI.add(completionNode);
  openAICLI.add(editNode);
  openAICLI.add(readMeNode);

  AccountFunctionNode accountFunctionNode = AccountFunctionNode();
  accountNode.node = accountFunctionNode;
  accountNode.adopt(accountFunctionNode);
  CompletionFunctionNode completionFunctionNode = CompletionFunctionNode();
  completionNode.node = completionFunctionNode;
  completionNode.adopt(completionFunctionNode);
  EditFunctionNode editFunctionNode = EditFunctionNode();
  editNode.adopt(editFunctionNode);



  controller.screen.content = [controller.display.widget, controller.input.widget];
  openAICLI.rootScreen();




  runApp(QuickApp(
      page: QuickPage(
        body: controller.screen.widget,
  )));
}
