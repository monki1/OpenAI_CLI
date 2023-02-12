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
    RegExpMatch? match = CLIRegexHelper.accountInputExp.firstMatch(s);
    String key = match!.namedGroup("key")?? "";
    String id = match.namedGroup("id")?? "";
    node.interpret(key, id);

    return Future.value(false);
  }

  @override
  bool isValidInput(String s) {
    return CLIRegexHelper.hasMatch(CLIRegexHelper.accountCommand, s);
  }

}

class AccountFunctionNode extends FunctionNode{

  interpret(String api_key, String org_id) async {
    if (!(api_key == "" || org_id == "")){
      OpenAICredential.setApiKey(api_key);
      OpenAICredential.setOrgID(org_id);
    }
    String apiKey = await OpenAICredential.getApiKey();
    String orgID = await OpenAICredential.getOrgID();

    controller.input.textEditingController.text = "account:\nAPI_KEY: $apiKey \nORG_ID: $orgID";

  }


}