import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    return Container(
      height: 500,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            widget.category?.nombre ?? 'Nueva categoria',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(),
            initialValue: widget.category?.nombre ?? '',
            onChanged: (value) {
              nombre = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomOutlinedButton(
            onPressed: () async {
              if (id == null) {
                await categoryProvider.newCategory(nombre);
                Navigator.pop(context);
              } else {
                await categoryProvider.updateCategory(nombre, id!);
                Navigator.pop(context);
              }
            },
            text: 'Guardar',
          )
        ],
      ),
    );
  }
}
