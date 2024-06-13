import '/flutter_flow/flutter_flow_util.dart';
import 'qr_payment_widget.dart' show QrPaymentWidget;
import 'package:flutter/material.dart';

class QrPaymentModel extends FlutterFlowModel<QrPaymentWidget> {
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
