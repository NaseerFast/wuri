// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

// // Automatic FlutterFlow imports

// import 'package:flutter/services.dart';
// import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

// Future<void> thisShallScan(BuildContext context) async {
//   var appState = FFAppState();

//   NFCAvailability availability;
//   try {
//     availability = await FlutterNfcKit.nfcAvailability;
//   } on PlatformException {
//     availability = NFCAvailability.not_supported;
//   }

//   if (availability == NFCAvailability.not_supported) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("NFC Not Supported"),
//           content: Text("NFC is not supported on this device."),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//     return;
//   }

//   try {
//     // Poll for the NFC tag
//     NFCTag tag = await FlutterNfcKit.poll();
//     updateNfcTagInAppState(context, appState, tag);
//   } catch (e) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text("Error scanning NFC tag: $e"),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// void updateNfcTagInAppState(
//     BuildContext context, FFAppState appState, NFCTag? tag) {
//   if (tag == null) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("No NFC Tag"),
//           content: Text("No NFC tag scanned."),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//     return;
//   }
//   // Get the ID of the scanned NFC tag
//   var currentTagId = tag.id;
//   // Update the app state with the scanned NFC tag ID
//   appState.update(() {
//     appState.scannedNFCTag = currentTagId;
//   });
// }

Future<void> thisShallScan(BuildContext context) async {
  // Check NFC availability
  NFCAvailability availability;
  try {
    availability = await FlutterNfcKit.nfcAvailability;
  } on PlatformException {
    availability = NFCAvailability.not_supported;
  }

  if (availability == NFCAvailability.not_supported) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("NFC Not Supported"),
          content: Text("NFC is not supported on this device."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return;
  }

  try {
    // Poll for the NFC tag
    NFCTag tag = await FlutterNfcKit.poll();

    // Display data in SnackBar
    String tagType = tag.type.toString();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Tag detected: Type - $tagType, ID - ${tag.id}"),
      ),
    );

    // If you need to handle specific types, you can add more conditions here
    if (tag.type == NFCTagType.iso15693) {
      // Handle ISO 7816 tags if needed
    } else if (tag.type == NFCTagType.iso15693) {
      // Handle ISO 15693 tags if needed
    }
    // Add more conditions for other types as necessary
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Error scanning NFC tag: $e"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
