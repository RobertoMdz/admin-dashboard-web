import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(email, password) {
    //TODO: Peticion http

    _token = 'urhf8u8h4h85.jeiruf87458f.ehfiuerf7';
    print(_token);
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;

    //TODO: Navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: Ir al backen a comprobar si el token es válido
    await Future.delayed(Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;

    notifyListeners();
    return true;
  }
}
