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

// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future ewSAAS(
  String walletBalance,
  String? walletId,
) async {
  // get the authenticated user's wallet data from wallets collection and display in widget
// Import necessary packages

// Get the current user's ID
  final String userId = FirebaseAuth.instance.currentUser!.uid;

// Get the user's wallet data from Firestore
  final DocumentSnapshot walletSnapshot =
      await FirebaseFirestore.instance.collection('wallets').doc(userId).get();

// Check if the user has a wallet
  if (walletSnapshot.exists) {
    // Get the wallet data
    final Object walletData = walletSnapshot.data()!;

    // Check if the wallet ID is provided
    if (walletId != null) {
      // Get the specific wallet data
      final Map<String, dynamic>? walletData =
          walletSnapshot.data() as Map<String, dynamic>?;

      // Check if the specific wallet data exists
      if (walletData != null) {
        // Get the wallet balance
        final String walletBalance = walletData['balance'];

        // Display the wallet balance in the widget
        return Text(walletBalance);
      } else {
        // The specific wallet data does not exist
        return Text('Wallet not found');
      }
    } else {
      // Get the default wallet data
// final Map<String, dynamic>? defaultWalletData = walletData['default'] as Map<String, dynamic>?;
      final Map<String, dynamic>? walletData =
          walletSnapshot.data() as Map<String, dynamic>?;
      final dynamic defaultWalletData = walletData!['default'];
      // Check if the default wallet data exists
      if (defaultWalletData != null) {
        // Get the wallet balance
        final String walletBalance = defaultWalletData['balance'];

        // Display the wallet balance in the widget
        return Text(walletBalance);
      } else {
        // The default wallet data does not exist
        return Text('Default wallet not found');
      }
    }
  }
}
