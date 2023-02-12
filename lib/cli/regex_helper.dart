class CLIRegexHelper{

  static String divider = "(:*)";
  static String accountCommand = "(account)";
  static String completionCommand = "(completion)";
  static RegExp completionInputExp = RegExp("^ *$completionCommand *$divider *(?<input>.*)");
  static RegExp accountInputExp = RegExp("^ *$accountCommand *$divider *((API_KEY: *(?<key>[\\S]+) *\nORG_ID: *(?<id>[\\S]+))? *\$)");
  // String s = r"(?<key>)";




  static bool hasMatch(String name, String s){
    return RegExp("^ *$name *$divider").hasMatch(s);
  }



}