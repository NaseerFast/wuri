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

import 'package:cloud_firestore/cloud_firestore.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

Future<void> maal(
  BuildContext context,
  String senderWalletID,
  String receiverWalletID,
  int amount,
) async {
  // Get reference to Firestore collection 'wallets'
  CollectionReference walletCollection =
      FirebaseFirestore.instance.collection('wallets');

  try {
    // Start a Firestore transaction
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // Get sender's wallet document
      QuerySnapshot senderWalletSnapshot = await walletCollection
          .where('wallet_id', isEqualTo: senderWalletID)
          .limit(1)
          .get();
      Map<String, dynamic>? senderWalletData;
      if (senderWalletSnapshot.docs.isNotEmpty) {
        senderWalletData =
            senderWalletSnapshot.docs.first.data() as Map<String, dynamic>?;
      } else {
        // throw 'Sender wallet not found';
        showErrorDialog(context, 'Sender wallet not found');
      }

      // Get receiver's wallet document
      QuerySnapshot receiverWalletSnapshot = await walletCollection
          .where('wallet_id', isEqualTo: receiverWalletID)
          .limit(1)
          .get();
      Map<String, dynamic>? receiverWalletData;
      if (receiverWalletSnapshot.docs.isNotEmpty) {
        receiverWalletData =
            receiverWalletSnapshot.docs.first.data() as Map<String, dynamic>?;
      } else {
        // throw 'Receiver wallet not found';
        showErrorDialog(context, 'Receiver wallet not found');
      }

      // Check if sender has enough balance to transfer
      if (senderWalletData == null ||
          senderWalletData['wallet_balance'] < amount) {
        // throw 'Insufficient balance';
        showErrorDialog(context, 'Insufficient balance');
      }

      // Update sender's wallet balance
      senderWalletData!['wallet_balance'] -= amount;
      transaction.update(senderWalletSnapshot.docs.first.reference,
          {'wallet_balance': senderWalletData['wallet_balance']});

      // Update receiver's wallet balance
      receiverWalletData!['wallet_balance'] += amount;
      transaction.update(receiverWalletSnapshot.docs.first.reference,
          {'wallet_balance': receiverWalletData['wallet_balance']});
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Transaction successsful!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } catch (e, stackTrace) {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Failure'),
    //       content: Text('Transaction failed: $e'),
    //       actions: <Widget>[
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
    print('Error: ${e.toString()}');
    print('Stack trace: $stackTrace');
  }
}
