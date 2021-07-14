import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: _buildInputDecoration(
                    hint: 'Email',
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: _buildInputDecoration(
                    hint: 'Password',
                    label: 'Password',
                    icon: Icons.lock_outline_rounded,
                  ),
                ),
                const SizedBox(height: 20),
                LinkText(
                  text: 'Crear cuenta',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.7),
        ),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.white.withOpacity(0.6),
      ),
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }
}
