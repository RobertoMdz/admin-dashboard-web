import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List categories = [];

  getCategories() async {
    final resp = CafeApi.httpGet('/categories');
    print(resp);

    notifyListeners();
  }
}
