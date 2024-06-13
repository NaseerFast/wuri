import '/flutter_flow/flutter_flow_util.dart';
import 'qr_payment_copy_widget.dart' show QrPaymentCopyWidget;
import 'package:flutter/material.dart';

class QrPaymentCopyModel extends FlutterFlowModel<QrPaymentCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var qrCodeResult2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
