import 'package:command_line_interface/command_line_interface.dart';


class OpenAICLI extends CLI{
  OpenAICLI(super.cli);

  @override
  void interpret(String s) {
    if(["^d","-/1"].contains(s)){
      scope.release();
    }
    super.interpret(s);

  }

  @override
  void rootScreen() {
    // TODO: implement rootScreen
  }
}




//regex helper
