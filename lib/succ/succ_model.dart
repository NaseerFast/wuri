import '/flutter_flow/flutter_flow_util.dart';
import 'succ_widget.dart' show SuccWidget;
import 'package:flutter/material.dart';

class SuccModel extends FlutterFlowModel<SuccWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
