// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class KaiQRCodeRenderWidget extends StatefulWidget {
  const KaiQRCodeRenderWidget({
    super.key,
    this.width,
    this.height,
    required this.data,
    this.cornersColor,
  });

  final double? width;
  final double? height;
  final String data;
  final Color? cornersColor;

  @override
  State<KaiQRCodeRenderWidget> createState() => _KaiQRCodeRenderWidgetState();
}

class _KaiQRCodeRenderWidgetState extends State<KaiQRCodeRenderWidget> {
  @override
  Widget build(BuildContext context) {
    final dimension = max<double>(this.widget.width!, this.widget.height!);

    return Container(
      width: dimension,
      height: dimension,
      child: QrImageView(
        data: this.widget.data,
        version: QrVersions.auto,
        size: dimension,
        backgroundColor: Colors.white,
        eyeStyle: new QrEyeStyle(
          color: this.widget.cornersColor ?? Colors.black,
        ),
        gapless: false,
      ),
    );
  }
}
