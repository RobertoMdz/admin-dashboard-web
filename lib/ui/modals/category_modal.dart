import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? category;
  CategoryModal({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.category?.id;
    nombre = widget.category?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      color: Colors.red,
      child: null,
    );
  }
}
