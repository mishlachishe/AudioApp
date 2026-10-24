import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import '../pages/formats_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FormatsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Добро пожаловать!\nВойдите в свой аккаунт\nИли создайте новый",
                  style: TextStyle(
                    fontFamily: "mononoki",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: "Email",
                  hintText: "example@mail.com",
                  prefixIcon: const Icon(Icons.email, color: Colors.greenAccent),
                  controller: _emailController,
                  focusNode: _emailFocus,
                  onFieldSubmitted: () => _passwordFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: "Пароль",
                  hintText: "Введите пароль",
                  prefixIcon: const Icon(Icons.lock, color: Colors.greenAccent),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  onFieldSubmitted: _submit,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Забыли пароль?",
                      style: TextStyle(fontFamily: "mononoki", color: Colors.white54),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(
                        fontFamily: "mononoki",
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  child: const Text("Войти"),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Нет аккаунта? ",
                        style: TextStyle(fontFamily: "mononoki", color: Colors.white70)
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                          "Зарегистрируйтесь",
                          style: TextStyle(fontFamily: "mononoki", color: Colors.limeAccent)
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}