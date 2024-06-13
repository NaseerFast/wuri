import '/flutter_flow/flutter_flow_util.dart';
import 'qwerty_widget.dart' show QwertyWidget;
import 'package:flutter/material.dart';

class QwertyModel extends FlutterFlowModel<QwertyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var qrResult = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
