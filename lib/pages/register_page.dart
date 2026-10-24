import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Регистрация прошла успешно!', style: TextStyle(fontFamily: "mononoki")),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Регистрация",
          style: TextStyle(
            fontFamily: "mononoki",
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                CustomTextFormField(
                  inputType: InputFieldType.name,
                  labelText: "ФИО",
                  hintText: "Иванов Иван Иванович",
                  prefixIcon: const Icon(Icons.person, color: Colors.greenAccent),
                  controller: _nameController,
                  focusNode: _nameFocus,
                  onFieldSubmitted: () => _emailFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
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
                  hintText: "Мин. 6 символов, буквы, цифры, +_-",
                  prefixIcon: const Icon(Icons.lock, color: Colors.greenAccent),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  onFieldSubmitted: () => _confirmFocus.requestFocus(),
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  inputType: InputFieldType.confirmPassword,
                  labelText: "Повторите пароль",
                  hintText: "Повторите пароль",
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.greenAccent),
                  controller: _confirmPasswordController,
                  passwordController: _passwordController,
                  focusNode: _confirmFocus,
                  onFieldSubmitted: _submit,
                ),
                const SizedBox(height: 30),
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
                  child: const Text("Зарегистрироваться"),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Уже есть аккаунт? ",
                        style: TextStyle(fontFamily: "mononoki", color: Colors.white70)
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                          "Войдите",
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