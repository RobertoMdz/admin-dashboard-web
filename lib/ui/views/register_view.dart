import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/router.dart';
import '../buttons/custom_outlined_button.dart';
import '../buttons/link_text.dart';
import '../inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(
          builder: (context) {
            final registerFormProvider =
                Provider.of<RegisterFormProvider>(context, listen: false);
            return Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 370),
                  child: Form(
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) =>
                              registerFormProvider.name = value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Nombre',
                            label: 'Nombre',
                            icon: Icons.supervised_user_circle_sharp,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingresa un nombre';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) =>
                              registerFormProvider.email = value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Email',
                            label: 'Email',
                            icon: Icons.email_outlined,
                          ),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no válido';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          onChanged: (value) =>
                              registerFormProvider.password = value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Password',
                            label: 'Password',
                            icon: Icons.lock_outline_rounded,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contraseña';
                            } else if (value.length < 8) {
                              return 'La contraseña debe tener al menos 8 caracteres';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPressed: () {
                            final isValidForm =
                                registerFormProvider.validateForm();
                            if (!isValidForm) return;
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);

                            authProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name,
                            );
                          },
                          text: 'Crear cuenta',
                        ),
                        const SizedBox(height: 20),
                        LinkText(
                          text: 'Ir al login',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Flurorouter.loginRoute);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
