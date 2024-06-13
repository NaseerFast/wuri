import '/flutter_flow/flutter_flow_util.dart';
import 'new_qr_payment_widget.dart' show NewQrPaymentWidget;
import 'package:flutter/material.dart';

class NewQrPaymentModel extends FlutterFlowModel<NewQrPaymentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var qrCodeResult = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
