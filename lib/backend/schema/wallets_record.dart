import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WalletsRecord extends FirestoreRecord {
  WalletsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "wallet_id" field.
  String? _walletId;
  String get walletId => _walletId ?? '';
  bool hasWalletId() => _walletId != null;

  // "wallet_balance" field.
  double? _walletBalance;
  double get walletBalance => _walletBalance ?? 0.0;
  bool hasWalletBalance() => _walletBalance != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _walletId = snapshotData['wallet_id'] as String?;
    _walletBalance = castToType<double>(snapshotData['wallet_balance']);
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wallets');

  static Stream<WalletsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WalletsRecord.fromSnapshot(s));

  static Future<WalletsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WalletsRecord.fromSnapshot(s));

  static WalletsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WalletsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WalletsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WalletsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WalletsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WalletsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWalletsRecordData({
  String? walletId,
  double? walletBalance,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wallet_id': walletId,
      'wallet_balance': walletBalance,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class WalletsRecordDocumentEquality implements Equality<WalletsRecord> {
  const WalletsRecordDocumentEquality();

  @override
  bool equals(WalletsRecord? e1, WalletsRecord? e2) {
    return e1?.walletId == e2?.walletId &&
        e1?.walletBalance == e2?.walletBalance &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(WalletsRecord? e) =>
      const ListEquality().hash([e?.walletId, e?.walletBalance, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is WalletsRecord;
}
