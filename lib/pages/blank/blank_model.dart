import '/flutter_flow/flutter_flow_util.dart';
import 'blank_widget.dart' show BlankWidget;
import 'package:flutter/material.dart';

class BlankModel extends FlutterFlowModel<BlankWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
