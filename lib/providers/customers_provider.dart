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

  Future<Usuario> getCustomerById(String uid) async {
    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);
      return user;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  /*Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      categories.add(newCategory);
      notifyListeners();
    } catch (e) {
      print('error al crear categoria');
    }
  }

  Future updateCategory(String name, String id) async {
    final data = {'nombre': name};

    try {
      await CafeApi.httpPut('/categorias/$id', data);

      final index = categories.indexWhere((category) => category.id == id);
      categories[index].nombre = name;
      notifyListeners();
    } catch (e) {
      print('error al actualizar categoria');
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete('/categorias/$id');

      categories.removeWhere((category) => category.id == id);
      notifyListeners();
    } catch (e) {
      print('error al actualizar categoria');
    }
  }*/
}
