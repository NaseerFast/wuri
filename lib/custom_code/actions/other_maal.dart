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

import 'package:pre_release/index.dart';

// ignore: unused_import
// import PaymentCompleteWidget;

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

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Success"),
        content: Text(message),
        actions: <Widget>[
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

Future<void> otherMaal(
  BuildContext context,
  String senderUserId,
  String receiverUserId,
  int amount,
) async {
  // Get reference to Firestore collection 'users'
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  try {
    // Start a Firestore transaction
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // Get sender's wallet document
      DocumentReference senderWalletRef = usersCollection
          .doc(senderUserId)
          .collection('userWallet')
          .doc('wallet');
      DocumentSnapshot senderSnapshot = await senderWalletRef.get();
      Map<String, dynamic>? senderData =
          senderSnapshot.data() as Map<String, dynamic>?;
      if (senderData == null) {
        showErrorDialog(context, 'Sender wallet not found');
        return;
      }
      // Get sender's wallet data
      Map<String, dynamic> senderWalletData = senderData;

      // Get receiver's wallet document
      DocumentReference receiverWalletRef = usersCollection
          .doc(receiverUserId)
          .collection('userWallet')
          .doc('wallet');
      DocumentSnapshot receiverSnapshot = await receiverWalletRef.get();
      Map<String, dynamic>? receiverData =
          receiverSnapshot.data() as Map<String, dynamic>?;
      if (receiverData == null) {
        showErrorDialog(context, 'Receiver wallet not found');
        return;
      }
      // Get receiver's wallet data
      Map<String, dynamic> receiverWalletData = receiverData;

      // Check if sender has enough balance to transfer
      if (senderWalletData['wallet_balance'] < amount) {
        showErrorDialog(context, 'Insufficient balance');
        return;
      }

      // Update sender's wallet balance
      senderWalletData['wallet_balance'] -= amount;
      transaction.update(senderWalletRef, senderWalletData);

      // Update receiver's wallet balance
      receiverWalletData['wallet_balance'] += amount;
      transaction.update(receiverWalletRef, receiverWalletData);
    });

    // Show success dialog
    showSuccessDialog(context, 'Transaction successful!');
  } catch (e, stackTrace) {
    showErrorDialog(context, 'Transaction failed: $e');
    print('Error: ${e.toString()}');
    print('Stack trace: $stackTrace');
  }
}
