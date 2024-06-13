import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String newAthUserWalletData(String walletblance) {
  // retrieve authenticated user's data  from wallets firebase collection.
  return '''
  Future<WalletsRecord?> getAuthenticatedUserWalletData() async {
    final userUid = currentUserUid;
    if (userUid == null) return null;
    final walletQuery = await FirebaseFirestore.instance
        .collection('wallets')
        .where('user', isEqualTo: userUid)
        .get();
    if (walletQuery.docs.isEmpty) return null;
    final walletData = walletQuery.docs.first.data();
    final walletRecord = WalletsRecord.fromJson(walletData);
    return walletRecord;
  }
''';
}

double? priceSummary(List<double>? prices) {
// summarize a list of prices from the product list
  if (prices == null || prices.isEmpty) {
    return null;
  }
  return prices.reduce((value, element) => value + element);
}

String newDtD() {
  // get authenticated user's data from firebase
  return '''
Future<void> getUserData() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    currentUserReference = userData.reference;
    currentUserDocument = UsersRecord.fromJson(userData.data());
  }
}
''';
}
