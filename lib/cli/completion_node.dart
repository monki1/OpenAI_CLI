


import 'dart:developer';

import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';

import '../config/openai_credential.dart';
import '../config/openai_wrapper.dart';

class CompletionNode extends CommandNode{
  late CompletionFunctionNode node;
  // = CompletionFunctionNode();
  CompletionNode();
  @override
  Future<bool> interpret(String s) async {
    if(!scope.isActive(interpret)){
      scope.request(interpret);
      String input = CLIRegexHelper.completionInputExp.firstMatch(s)!.namedGroup("input")?? "";
      return interpret(input);
    }
    controller.display.content += [Text("prompt: $s")];

    node.complete(s);

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
    if (input == "") {
      return [];
    }
    OpenAIWrapper wrapper = OpenAIWrapper(await OpenAICredential.client);
    return await wrapper.completion(input);
  }

  complete(String input) async {
    List<String> completions = await _complete(input);
    String result = "-->\n";
    for (int i = 0; i < completions.length; i++) {
      result += "${i + 1}. ${completions[i]}\n";
    }
    controller.display.content += [Text(result)];
  }
}