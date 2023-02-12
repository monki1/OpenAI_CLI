

import 'package:openai_client/openai_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenAICredential{
  static OpenAIClient? _client;



  static Future<String> getApiKey ()async {
        String key = (await SharedPreferences.getInstance()).getString("openai_api_key") ?? "";
        return key;

  }
  static setApiKey(String key)async{
    (await SharedPreferences.getInstance()).setString("openai_api_key", key);
    _client = await _getClient();
  }
  static Future<String> getOrgID ()async {
        String key = (await SharedPreferences.getInstance()).getString("openai_org_id") ?? "";
        return key;
  }
  static setOrgID(String key)async{
    (await SharedPreferences.getInstance()).setString("openai_org_id", key);
    _client = await _getClient();
  }

  static Future<OpenAIClient> _getClient()async{

      return OpenAIClient(
        configuration: OpenAIConfiguration(
          apiKey: await getApiKey(), organizationId : await getOrgID()

        ),
        enableLogging: true,);

  }

  static Future<OpenAIClient> get client async {
    _client ??= await _getClient();
    return _client!;
}









  //

}