import 'package:flutter/material.dart';

import '../api/CafeApi.dart';
import '../models/category.dart';
import '../models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);
    this.categories = categoriesResponse.categorias;

    notifyListeners();
  }
}
