

import 'package:command_line_interface/command_line_interface.dart';

abstract class OpenAICLINode extends CommandNode{
  late FunctionNode node;

  adopt(FunctionNode node_) {
    node = node_;
    node.getAdopted(node);

  }
}