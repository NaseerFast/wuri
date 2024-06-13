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

// Import necessary packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future getBal(
  int walletBalance,
  String walletid,
) async {
  // get authenticated user's wallet balance from wallets collection

// Get authenticated user's ID
  final user = FirebaseAuth.instance.currentUser;
  final uid = user!.uid;

// Access the wallets collection and retrieve the user's wallet document
  final walletDoc = FirebaseFirestore.instance
      .collection('wallets')
      .doc(uid)
      .collection('userWallets')
      .doc(walletid);

// Update the wallet balance field with the new balance
  await walletDoc.update({'balance': walletBalance});

// Retrieve the updated wallet document and return the balance field
  final updatedWalletDoc = await walletDoc.get();
  final updatedBalance = updatedWalletDoc.data()!['balance'];
  return updatedBalance;
}
