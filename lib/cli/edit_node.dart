


import 'dart:developer';

import 'package:command_line_interface/command_line_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';
// import 'package:open_ai_cli/style/style.dart';

import '../config/openai_credential.dart';
import '../config/openai_wrapper.dart';
import '../ui/header.dart';
import '../ui/style.dart';

class EditNode extends CommandNode{
  late EditFunctionNode node;
  // = EditFunctionNode();
  EditNode();
  @override
  Future<bool> interpret(String s) async {
    if(!scope.isActive(interpret)){
      scope.request(interpret);
      controller.screen.content = [headerWidget("<<<      open ai edit", (){
        dropText = CLIRegexHelper.exit;
      })]+controller.screen.content;
      controller.display.content = [];
      List<String> args =  s.split(CLIRegexHelper.divider);
      String input = args.length > 1 ? args[1] : "";

      return interpret(input);
    }
    if(s.trim().isNotEmpty) {
      controller.display.content += [SelectableText("prompt: $s")];
    }
    String input = CLIRegexHelper.editInputExp.firstMatch(s)?.namedGroup("input")?? "";
    String instruction = CLIRegexHelper.editInputExp.firstMatch(s)?.namedGroup("instruction")?? "";
    // if(input.isEmpty || instruction.isEmpty){
    //   // controller.display.content += [SelectableText("INPUT INCOMPLETE")];
    //   return true;
    // }
    node.edit(instruction, input);

    return true;
  }

  @override
  bool isValidInput(String s) {
    log(CLIRegexHelper.hasMatch(CLIRegexHelper.editCommand, s).toString());
    return CLIRegexHelper.hasMatch(CLIRegexHelper.editCommand, s);
  }

}

class EditFunctionNode extends FunctionNode {
  Future<List<String>> _edit(String instruction, String input) async {
    OpenAIWrapper wrapper = OpenAIWrapper(await OpenAICredential().client);
    return await wrapper.edits(instruction, input);
  }

  edit(String instruction, String input) async {
    dropText = "input:[ ] \ninstruction:[ ]";
    // controller.input.textEditingController.selection.pos

    if((instruction.isEmpty || input.isEmpty)){
      if(!(instruction.isEmpty && input.isEmpty)){
        controller.display.content += [oacOutputWidget("INPUT INCOMPLETE")];
      }
      return;
    }
    List<String> edits = await _edit(instruction, input);
    if(edits.isEmpty){return;}
    String result = "-->\n";
    for (int i = 0; i < edits.length; i++) {
      result += "   ${edits[i]}\n";
    }
    controller.display.content += [oacOutputWidget(result)];
  }
}