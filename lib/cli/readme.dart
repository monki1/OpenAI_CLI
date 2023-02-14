import 'package:clipboard/clipboard.dart';
import 'package:command_line_interface/command_line_interface.dart';


import '../regex_helper.dart';



class ReadMeNode extends CommandNode{
  @override
  Future<bool> interpret(String s) async {
    String url = CLIRegexHelper.readmeURL;
    dropText = "url copied to clipboard";
    await FlutterClipboard.copy(url);
    // showClipboardNotification();
    return Future.value(false);
  }

  @override
  bool isValidInput(String s) {
   return CLIRegexHelper.hasMatch(CLIRegexHelper.readmeCommand, s);
  }



}