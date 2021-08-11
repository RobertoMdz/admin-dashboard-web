import 'package:flutter/material.dart';

import '../api/CafeApi.dart';
import '../models/category.dart';
import '../models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  Future getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);
    this.categories = categoriesResponse.categorias;

    notifyListeners();
  }

  Future newCategory(String name) async {
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
  }
}
