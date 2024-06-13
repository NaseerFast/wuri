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

// ignore_for_file: unnecessary_null_comparison

// import 'package:flutter/material';

Future transferMoney(
  BuildContext context,
  String? senderWalletID,
  String? receiverWalletID,
  String? senderUserID,
  String? receiverUserID,
  int amount,
) async {
  try {
    // Check if any required parameter is null
    if (senderWalletID == null ||
        receiverWalletID == null ||
        senderUserID == null ||
        receiverUserID == null) {
      throw Exception("Required parameters are missing.");
    }

    // Assuming you have a function to get the user's wallet reference
    DocumentReference? senderWalletRef =
        getUserWalletRef(senderUserID, senderWalletID);
    DocumentReference? receiverWalletRef =
        getUserWalletRef(receiverUserID, receiverWalletID);

    // Check if wallet references are null
    if (senderWalletRef == null || receiverWalletRef == null) {
      throw Exception("Failed to get wallet references.");
    }

    // Perform a transaction to update both wallets atomically
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // Get the current balance of both wallets
      DocumentSnapshot? senderWalletSnapshot =
          await transaction.get(senderWalletRef);
      DocumentSnapshot? receiverWalletSnapshot =
          await transaction.get(receiverWalletRef);

      // Check if wallet snapshots are null
      if (senderWalletSnapshot == null || receiverWalletSnapshot == null) {
        throw Exception("Failed to get wallet data.");
      }

      // Calculate the new balances
      double senderNewBalance =
          (senderWalletSnapshot.data() as Map<String, dynamic>)['balance'] -
              amount;
      double receiverNewBalance =
          (receiverWalletSnapshot.data() as Map<String, dynamic>)['balance'] +
              amount;

      // Check if sender has sufficient balance
      if (senderNewBalance < 0) {
        throw Exception("Insufficient balance.");
      }

      // Update the sender's wallet
      transaction.update(senderWalletRef, {'balance': senderNewBalance});

      // Update the receiver's wallet
      transaction.update(receiverWalletRef, {'balance': receiverNewBalance});
    });

    // Transaction successful, show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Money transferred successfully."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  } catch (e) {
    // Transaction failed, show error dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

DocumentReference<Object?>? getUserWalletRef(String s, String t) {
  return null;
}
