import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: "Иванов Иван Иванович");
  final _emailController = TextEditingController(text: "test123@mail.ru");
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Профиль сохранен', style: TextStyle(fontFamily: "mononoki")),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Профиль",
          style: TextStyle(
            fontFamily: "mononoki",
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Аватарка в стиле карточек из FormatsScreen
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  child: const Icon(Icons.pets, size: 60, color: Colors.greenAccent),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  inputType: InputFieldType.name,
                  labelText: "ФИО",
                  hintText: "Введите ФИО",
                  prefixIcon: const Icon(Icons.person, color: Colors.greenAccent),
                  controller: _nameController,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  inputType: InputFieldType.email,
                  labelText: "Email",
                  hintText: "Введите Email",
                  prefixIcon: const Icon(Icons.email, color: Colors.greenAccent),
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  inputType: InputFieldType.password,
                  labelText: "Пароль",
                  hintText: "Новый пароль (необязательно)",
                  prefixIcon: const Icon(Icons.lock, color: Colors.greenAccent),
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  inputType: InputFieldType.confirmPassword,
                  labelText: "Повторите пароль",
                  hintText: "Повторите новый пароль",
                  prefixIcon: const Icon(Icons.lock_outline, color: Colors.greenAccent),
                  controller: _confirmPasswordController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _save,
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
                    child: const Text("Сохранить"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}