


import 'dart:developer';

import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';
import 'package:open_ai_cli/ui/header.dart';
// import 'package:open_ai_cli/style/style.dart';

import '../config/openai_credential.dart';
import '../config/openai_wrapper.dart';
import '../ui/style.dart';
import 'open_ai_cli_node.dart';

class CompletionNode extends OpenAICLINode{
  // late CompletionFunctionNode node;
  // = CompletionFunctionNode();
  CompletionNode();
  @override
  Future<bool> interpret(String s) async {
    if(!scope.isActive(interpret)){
      scope.request(interpret);
      String input = CLIRegexHelper.completionInputExp.firstMatch(s)?.namedGroup("input")?? "";
      controller.screen.content = [headerWidget("<< open ai completion",
                                  (){dropText = CLIRegexHelper.exit;}),
                                  ]+controller.screen.content;
      controller.display.content = [];
      dropText = "";
      return interpret(input);
    }

    if(s.trim().isEmpty){
      return true;
    }
    controller.display.content += [oacPromptWidget("prompt:\n   "+s)];

    (node as CompletionFunctionNode).complete(s);

    return true;
  }

  @override
  bool isValidInput(String s) {
    log(CLIRegexHelper.hasMatch(CLIRegexHelper.completionCommand, s).toString());
    return CLIRegexHelper.hasMatch(CLIRegexHelper.completionCommand, s);
  }

}

class CompletionFunctionNode extends FunctionNode {
  @override
  Future<List<String>> _complete(String input) async {
    OpenAIWrapper wrapper = OpenAIWrapper(await OpenAICredential().client);
    return await wrapper.completion(input);
  }

  complete(String input) async {
    List<String> completions = await _complete(input);
    String result = "-->\n";
    for (int i = 0; i < completions.length; i++) {
      result += "   ${completions[i]}\n";
    }
    controller.display.content += [oacOutputWidget(result)];
  }
}