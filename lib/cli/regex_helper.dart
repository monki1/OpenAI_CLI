class CLIRegexHelper{

  static String divider = "(:*)";
  static String accountCommand = "(account)";
  static String completionCommand = "(completion)";
  static RegExp completionInputExp = RegExp("^ *$completionCommand *$divider *(?<input>.*)\$");
  // static RegExp accountInputExp = RegExp("^ *$accountCommand *$divider *"+ r'\n? *(API_KEY: *(?<key>[\S]+))? *\n? *(ORG_ID: *(?<id>[\S]+))? *$');
  static RegExp accountInputExp = RegExp(r'^\s*account\s*:\s*(API_KEY:\s*\[\s*(?<key>[^\]\s]*)\s*\])?\s*(ORG_ID:\s*\[\s*(?<id>[^\]\s]*)\s*\])?\s*$');
  // String s = r"(?<key>)"
  static String editCommand = "(edit)";
  static RegExp editInputExp = RegExp(r"^\s*(input:\s*\[\s*(?<input>[^\]\s]*)\s*\])?\s*(instruction:\s*\[\s*(?<instruction>[^\]\s]*)\s*\])?\s*$" );



  static bool hasMatch(String name, String s){
    return RegExp("^ *$name *$divider").hasMatch(s);
  }


  static List<String> releaseScopeCommands = [exit, exitConsole, exitMobile];

  static String exit = "\$exit";
  static String exitConsole = "^d";
  static String exitMobile = "-/1" ;


  static String readmeURL = "https://github.com/monki1/OpenAI_CLI/blob/main/README.md";
  static String readmeCommand = "(readme)";
}