import '/flutter_flow/flutter_flow_util.dart';
import 'make_payment_widget.dart' show MakePaymentWidget;
import 'package:flutter/material.dart';

class MakePaymentModel extends FlutterFlowModel<MakePaymentWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4cdqu7ki' /* Please enter an amount */,
      );
    }

    return null;
  }

  // State field(s) for senderWalleID widget.
  FocusNode? senderWalleIDFocusNode;
  TextEditingController? senderWalleIDTextController;
  String? Function(BuildContext, String?)? senderWalleIDTextControllerValidator;
  // State field(s) for receiverWalletID widget.
  FocusNode? receiverWalletIDFocusNode;
  TextEditingController? receiverWalletIDTextController;
  String? Function(BuildContext, String?)?
      receiverWalletIDTextControllerValidator;
  // State field(s) for reason widget.
  FocusNode? reasonFocusNode;
  TextEditingController? reasonTextController;
  String? Function(BuildContext, String?)? reasonTextControllerValidator;

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
  }

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    senderWalleIDFocusNode?.dispose();
    senderWalleIDTextController?.dispose();

    receiverWalletIDFocusNode?.dispose();
    receiverWalletIDTextController?.dispose();

    reasonFocusNode?.dispose();
    reasonTextController?.dispose();
  }
}
