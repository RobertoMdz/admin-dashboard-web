import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('validated -- $email $password $name');
      return true;
    } else {
      return false;
    }
  }
}
