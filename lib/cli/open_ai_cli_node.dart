

import 'package:command_line_interface/command_line_interface.dart';

abstract class OpenAICLINode extends CommandNode{
  late FunctionNode node;
  @override
  adopt(CLINode node_) {
    if(node_ is FunctionNode){
      node = node_;
    }
    return super.adopt(node);
  }
}