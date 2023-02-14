import 'package:command_line_interface/command_line_interface.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';

import '../config/openai_credential.dart';
import 'open_ai_cli_node.dart';

class AccountNode extends OpenAICLINode{


  AccountNode(super.node);
  // late AccountFunctionNode node;
  // = AccountFunctionNode();


  @override
  Future<bool> interpret(String s) {
    // throw UnimplementedError();
    if(!scope.isActive(interpret)){
      scope.request(interpret);
      controller.display.content = [];
      dropText = "";
      return interpret(s);
    }
    RegExpMatch? match = CLIRegexHelper.accountInputExp.firstMatch(s);
    // }
    String key = match?.namedGroup("key")?? "";
    String id = match?.namedGroup("id")?? "";
    (node as AccountFunctionNode).interpret(key, id);


    return Future.value(false);
  }

  @override
  bool isValidInput(String s) {
    return CLIRegexHelper.hasMatch(CLIRegexHelper.accountCommand, s);
  }

}

class AccountFunctionNode extends FunctionNode{

  interpret(String apiKey, String orgID) async {
    //if both are not empty, set them
    if(apiKey.isNotEmpty){
      await OpenAICredential().setApiKey(apiKey);
    }
    if(orgID.isNotEmpty){
      await OpenAICredential().setOrgID(orgID);
    }
    String _apiKey = await OpenAICredential().getApiKey();
    String _orgID = await OpenAICredential().getOrgID();
    if(apiKey.isNotEmpty&&orgID.isNotEmpty){
      return;
    }
    dropText = "account: \nAPI_KEY:[\n$_apiKey\n] \nORG_ID:[\n$_orgID\n]";

  }


}