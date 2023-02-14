

import 'package:command_line_interface/command_line_interface.dart';

abstract class OACNode extends CommandNode{
  FunctionNode node;
  OACNode(this.node);

  @override
  getAdopted(CLINode node_) {
    node.getAdopted(node_ );
    super.getAdopted(node_);
  }
}