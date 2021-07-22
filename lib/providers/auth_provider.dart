import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(email, password) {
    //TODO: Peticion http

    _token = 'urhf8u8h4h85.jeiruf87458f.ehfiuerf7';
    print(_token);
    LocalStorage.prefs.setString('token', _token!);

    //TODO: Navegar al dashboard
    notifyListeners();
  }
}
