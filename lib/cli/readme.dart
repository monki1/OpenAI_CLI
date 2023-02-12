import 'package:command_line_interface/command_line_interface.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';

class ReadMeNode extends CommandNode{
  @override
  Future<bool> interpret(String s) {
    dropText = CLIRegexHelper.readmeURL;
    return Future.value(false);
  }

  @override
  bool isValidInput(String s) {
   return CLIRegexHelper.hasMatch(CLIRegexHelper.readmeCommand, s);
  }



}