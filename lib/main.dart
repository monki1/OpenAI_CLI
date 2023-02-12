import 'dart:developer';

import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_cli/quick_app.dart';
import 'cli/account_node.dart';
import 'cli/cli.dart';
import 'cli/completion_node.dart';






Future<void> main() async {

  //ensure flutter widget binding
  WidgetsFlutterBinding.ensureInitialized();
  CLIController controller = CLIController();
  OpenAICLI openAICLI = OpenAICLI(controller);
  AccountNode accountNode = AccountNode();
  CompletionNode completionNode = CompletionNode();

  openAICLI.add(accountNode);
  openAICLI.add(completionNode);

  AccountFunctionNode accountFunctionNode = AccountFunctionNode();
  accountNode.node = accountFunctionNode;
  accountNode.adopt(accountFunctionNode);
  CompletionFunctionNode completionFunctionNode = CompletionFunctionNode();
  completionNode.node = completionFunctionNode;
  completionNode.adopt(completionFunctionNode);

  controller.screen.content = [controller.display.widget, controller.input.widget];



  runApp(QuickApp(
      page: QuickPage(
        body: controller.screen.widget,
  )));
}
