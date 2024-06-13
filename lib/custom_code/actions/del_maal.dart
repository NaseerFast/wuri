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

Future<void> delMaal(
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
        // showErrorDialog(context, 'Sender wallet not found');
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
        // showErrorDialog(context, 'Receiver wallet not found');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Color(0xFFE57373),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24.0),
                  Icon(Icons.error_outline, color: Colors.white, size: 64.0),
                  SizedBox(height: 16.0),
                  Text(
                    'Recipient Not Found',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'The recipient you entered could not be found. Please check the details and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD32F2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                    child: Text(
                      'Dismiss',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }

      // Check if sender has enough balance to transfer
      if (senderWalletData == null ||
          senderWalletData['wallet_balance'] < amount) {
        // throw 'Insufficient balance';
        // showErrorDialog(context, 'Insufficient balance');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Color(0xFFF5F5F5),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24.0),
                  Icon(Icons.account_balance_wallet_outlined,
                      color: Color(0xFFBDBDBD), size: 48.0),
                  SizedBox(height: 16.0),
                  Text(
                    'Insufficient Funds',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Your account does not have enough funds to complete this transaction. Please add more funds and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Trigger the "Try Again" action
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                        ),
                        child: Text(
                          'Try Again',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Trigger the "Dismiss" action
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                        ),
                        child: Text(
                          'Dismiss',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      } else {
        // Update sender's wallet balance
        senderWalletData!['wallet_balance'] -= amount;
        transaction.update(senderWalletSnapshot.docs.first.reference,
            {'wallet_balance': senderWalletData['wallet_balance']});

        // Update receiver's wallet balance
        receiverWalletData!['wallet_balance'] += amount;
        transaction.update(receiverWalletSnapshot.docs.first.reference,
            {'wallet_balance': receiverWalletData['wallet_balance']});

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Color(0xFFF5F5F5),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24.0),
                  Icon(Icons.check_circle, color: Colors.green, size: 64.0),
                  SizedBox(height: 16.0),
                  Text(
                    'Payment Successful',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Your payment has been processed successfully. Thank you !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                    child: Text(
                      'Dismiss',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    });

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20.0),
    //       ),
    //       backgroundColor: Color(0xFFF5F5F5),
    //       content: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           SizedBox(height: 24.0),
    //           Icon(Icons.check_circle, color: Colors.green, size: 64.0),
    //           SizedBox(height: 16.0),
    //           Text(
    //             'Payment Successful',
    //             style: TextStyle(
    //               fontSize: 24.0,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           SizedBox(height: 16.0),
    //           Text(
    //             'Your payment has been processed successfully. Thank you !',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               fontSize: 16.0,
    //               color: Colors.grey[600],
    //             ),
    //           ),
    //           SizedBox(height: 24.0),
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: Color(0xFF4CAF50),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20.0),
    //               ),
    //               padding:
    //                   EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
    //             ),
    //             child: Text(
    //               'Dismiss',
    //               style: TextStyle(
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
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
