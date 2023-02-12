import 'package:openai_client/openai_client.dart';

class OpenAIWrapper{

  int completionMaxTokens = 256;
  String completionModel = 'text-davinci-002';
  String editsModel = 'text-davinci-edit-001';
  OpenAIClient client;
  OpenAIWrapper(this.client);

  Future<List<String>> completion(String s)async{
    Completion completion = (await (await client.completions.
    create(model: completionModel, prompt: s, maxTokens: completionMaxTokens)).data);
   List <String> response =[] ;
    for (var choice in completion.choices) {
    response += [choice.text.trim()];
    }
    return response;
  }

  Future<List<String>> edits(String intruction, String input)async{
      Edits edits_ = ( await client.edits
        .create(
      model: editsModel,
      instruction: intruction,
      input: input,
    )
        .data);
      List <String> response =[] ;
      for (var choice in edits_.choices) {
        response += [choice.text.trim()];
      }
      return response;
  }



}











