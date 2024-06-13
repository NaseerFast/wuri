import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserWalletRecord extends FirestoreRecord {
  UserWalletRecord._(
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
  int? _walletBalance;
  int get walletBalance => _walletBalance ?? 0;
  bool hasWalletBalance() => _walletBalance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _walletId = snapshotData['wallet_id'] as String?;
    _walletBalance = castToType<int>(snapshotData['wallet_balance']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userWallet')
          : FirebaseFirestore.instance.collectionGroup('userWallet');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userWallet').doc(id);

  static Stream<UserWalletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserWalletRecord.fromSnapshot(s));

  static Future<UserWalletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserWalletRecord.fromSnapshot(s));

  static UserWalletRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserWalletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserWalletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserWalletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserWalletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserWalletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserWalletRecordData({
  String? walletId,
  int? walletBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wallet_id': walletId,
      'wallet_balance': walletBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserWalletRecordDocumentEquality implements Equality<UserWalletRecord> {
  const UserWalletRecordDocumentEquality();

  @override
  bool equals(UserWalletRecord? e1, UserWalletRecord? e2) {
    return e1?.walletId == e2?.walletId &&
        e1?.walletBalance == e2?.walletBalance;
  }

  @override
  int hash(UserWalletRecord? e) =>
      const ListEquality().hash([e?.walletId, e?.walletBalance]);

  @override
  bool isValidKey(Object? o) => o is UserWalletRecord;
}
