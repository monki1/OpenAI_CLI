

import 'package:openai_client/openai_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpenAICredential{
  static OpenAICredential _instance = OpenAICredential._internal();
  factory OpenAICredential() => _instance;
  OpenAICredential._internal();
   String _apiKey="";
   String _orgID="";
   OpenAIClient? _client;



   Future<String> getApiKey ()async {
    if(_apiKey != ""){return _apiKey;}
        String key = (await SharedPreferences.getInstance()).getString("openai_api_key") ?? "";
    _apiKey = key;

        return key;

  }
   setApiKey(String key)async{
    _apiKey = key;
    (await SharedPreferences.getInstance()).setString("openai_api_key", key);
    // _client = await _getClient();
  }
   Future<String> getOrgID ()async {
    if(_orgID != ""){return _orgID;}
        String key = (await SharedPreferences.getInstance()).getString("openai_org_id") ?? "";
    _orgID = key;
        return key;
  }
   setOrgID(String key)async{
    _orgID = key;
    (await SharedPreferences.getInstance()).setString("openai_org_id", key);
    // _client = await _getClient();
  }

   Future<OpenAIClient> _getClient()async{
     print("$_apiKey, $_orgID");

      return OpenAIClient(
        configuration: OpenAIConfiguration(
          apiKey: await getApiKey(), organizationId : await getOrgID()

        ),
        enableLogging: true,);

  }

   Future<OpenAIClient> get client async {
    _client ??= await _getClient();
    return _client!;
}


}


