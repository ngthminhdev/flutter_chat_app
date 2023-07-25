import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  //singleton
  static final LocalStorageService _instance = LocalStorageService._internal();
  late SharedPreferences? _pref;

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<void> _initPref() async {
    _pref ??= await SharedPreferences.getInstance();
  }
}

final localStorageService = LocalStorageService()._initPref();
