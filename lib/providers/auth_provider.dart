import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {"correo": email, "password": password};

    CafeApi.httpPost('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationService.showSnackbarError(e);
    });
  }

  register(String email, String password, String name) {
    final data = {"nombre": name, "correo": email, "password": password};

    CafeApi.httpPost('/usuarios', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationService.showSnackbarError(e);
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logOut() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
