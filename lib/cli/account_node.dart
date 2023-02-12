import 'package:command_line_interface/command_line_interface.dart';
import 'package:open_ai_cli/cli/regex_helper.dart';

import '../config/openai_credential.dart';

class AccountNode extends CommandNode{
  late AccountFunctionNode node;
  // = AccountFunctionNode();
  AccountNode();

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
    node.interpret(key, id);
    print("key: $key, id: $id");

    return Future.value(false);
  }

  @override
  bool isValidInput(String s) {
    return CLIRegexHelper.hasMatch(CLIRegexHelper.accountCommand, s);
  }

}

class AccountFunctionNode extends FunctionNode{

  interpret(String apiKey_, String orgID_) async {
    //if both are not empty, set them
    if(!(apiKey_ == "" || orgID_ == "")){
      await OpenAICredential().setApiKey(apiKey_);
      await OpenAICredential().setOrgID(orgID_);
    }

    String apiKey = await OpenAICredential().getApiKey();
    String orgID = await OpenAICredential().getOrgID();

    dropText = "account: \nAPI_KEY:\[ $apiKey\] \nORG_ID:\[ $orgID\]";

  }


}