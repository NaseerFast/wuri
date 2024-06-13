import '/flutter_flow/flutter_flow_util.dart';
import 'nfc_read_widget.dart' show NfcReadWidget;
import 'package:flutter/material.dart';

class NfcReadModel extends FlutterFlowModel<NfcReadWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
