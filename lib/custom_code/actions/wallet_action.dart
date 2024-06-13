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
import 'package:firebase_auth/firebase_auth.dart';

Future walletAction(
  String authUserWalletID,
  int authUserWaletBalance,
) async {
  // get auhenticated user's walletId and wallet balance from wallets collection and assign to varables.
// Import necessary packages

// Get authenticated user's ID
  final String authUserID = FirebaseAuth.instance.currentUser!.uid;

// Access the wallets collection and get the document with the authenticated user's ID
  final DocumentSnapshot walletDoc = await FirebaseFirestore.instance
      .collection('wallets')
      .doc(authUserID)
      .get();

// Get the wallet ID and balance from the document
  final String walletID = walletDoc.get('walletId');
  final int walletBalance = walletDoc.get('balance');

// Assign the values to the provided variables
  authUserWalletID = walletID;
  authUserWaletBalance = walletBalance;

// Return a success message
  return 'Wallet information retrieved successfully.';
}
