import 'package:flutter/material.dart';

import '../api/CafeApi.dart';
import '../models/http/customers_response.dart';
import '../models/usuario.dart';

class CustomersProvider extends ChangeNotifier {
  List<Usuario> customers = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  CustomersProvider() {
    getPaginatedCustomers();
  }

  Future getPaginatedCustomers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=15&desde=0');
    final customersResponse = CustomersResponse.fromMap(resp);

    this.customers = [...customersResponse.usuarios];

    isLoading = false;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    customers.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }

  Future<Usuario?> getCustomerById(String uid) async {
    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      return null;
    }
  }

  void refreshUser(Usuario newUser) {
    this.customers = this.customers.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }

      return user;
    }).toList();

    notifyListeners();
  }
}
