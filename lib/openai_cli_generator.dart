import 'package:command_line_interface/command_line_interface.dart';

import 'cli/account_node.dart';
import 'cli/cli.dart';
import 'cli/completion_node.dart';
import 'cli/edit_node.dart';
import 'cli/readme.dart';

Future<OpenAICLI> openAiCLIGenerator(CLIController controller) async {
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
