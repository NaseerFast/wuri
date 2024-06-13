import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _myCart =
          prefs.getStringList('ff_myCart')?.map((path) => path.ref).toList() ??
              _myCart;
    });
    _safeInit(() {
      _myCartSummary =
          prefs.getStringList('ff_myCartSummary')?.map(double.parse).toList() ??
              _myCartSummary;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _QrData = '';
  String get QrData => _QrData;
  set QrData(String value) {
    _QrData = value;
  }

  String _currentAuthuserId = '';
  String get currentAuthuserId => _currentAuthuserId;
  set currentAuthuserId(String value) {
    _currentAuthuserId = value;
  }

  String _authUserWallet = '';
  String get authUserWallet => _authUserWallet;
  set authUserWallet(String value) {
    _authUserWallet = value;
  }

  int _authUserBallance = 0;
  int get authUserBallance => _authUserBallance;
  set authUserBallance(int value) {
    _authUserBallance = value;
  }

  DocumentReference? _currentAuthUser;
  DocumentReference? get currentAuthUser => _currentAuthUser;
  set currentAuthUser(DocumentReference? value) {
    _currentAuthUser = value;
  }

  List<DocumentReference> _myCart = [];
  List<DocumentReference> get myCart => _myCart;
  set myCart(List<DocumentReference> value) {
    _myCart = value;
    prefs.setStringList('ff_myCart', value.map((x) => x.path).toList());
  }

  void addToMyCart(DocumentReference value) {
    myCart.add(value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void removeFromMyCart(DocumentReference value) {
    myCart.remove(value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void removeAtIndexFromMyCart(int index) {
    myCart.removeAt(index);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void updateMyCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myCart[index] = updateFn(_myCart[index]);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  void insertAtIndexInMyCart(int index, DocumentReference value) {
    myCart.insert(index, value);
    prefs.setStringList('ff_myCart', _myCart.map((x) => x.path).toList());
  }

  List<double> _myCartSummary = [];
  List<double> get myCartSummary => _myCartSummary;
  set myCartSummary(List<double> value) {
    _myCartSummary = value;
    prefs.setStringList(
        'ff_myCartSummary', value.map((x) => x.toString()).toList());
  }

  void addToMyCartSummary(double value) {
    myCartSummary.add(value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void removeFromMyCartSummary(double value) {
    myCartSummary.remove(value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromMyCartSummary(int index) {
    myCartSummary.removeAt(index);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void updateMyCartSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    myCartSummary[index] = updateFn(_myCartSummary[index]);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInMyCartSummary(int index, double value) {
    myCartSummary.insert(index, value);
    prefs.setStringList(
        'ff_myCartSummary', _myCartSummary.map((x) => x.toString()).toList());
  }

  String _WalletBalance = '';
  String get WalletBalance => _WalletBalance;
  set WalletBalance(String value) {
    _WalletBalance = value;
  }

  DocumentReference? _userstate;
  DocumentReference? get userstate => _userstate;
  set userstate(DocumentReference? value) {
    _userstate = value;
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
  }

  String _walletIDPhone = '';
  String get walletIDPhone => _walletIDPhone;
  set walletIDPhone(String value) {
    _walletIDPhone = value;
  }

  String _scannedNFCTag = '';
  String get scannedNFCTag => _scannedNFCTag;
  set scannedNFCTag(String value) {
    _scannedNFCTag = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
