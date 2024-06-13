import '/flutter_flow/flutter_flow_util.dart';
import 'my_acc_widget.dart' show MyAccWidget;
import 'package:flutter/material.dart';

class MyAccModel extends FlutterFlowModel<MyAccWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
