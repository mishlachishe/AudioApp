import 'package:flutter/material.dart';

enum InputFieldType { name, email, password, confirmPassword }

class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType;
  final String labelText;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextEditingController? passwordController;
  final VoidCallback? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.passwordController,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true;

  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Поле не может быть пустым";
    }

    switch (widget.inputType) {
      case InputFieldType.name:
        final nameReg = RegExp(r'^[a-zA-Zа-яА-ЯёЁ\s]+$');
        if (!nameReg.hasMatch(value)) {
          return "Только буквы и пробелы";
        }
        break;
      case InputFieldType.email:
        final emailReg = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
        if (!emailReg.hasMatch(value)) {
          return "Некорректный Email";
        }
        break;
      case InputFieldType.password:
        final passwordReg = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[+_-]).{6,}$');
        if (!passwordReg.hasMatch(value)) {
          return "Мин. 4 символов, буквы, цифры и (+, _, -)";
        }
        break;
      case InputFieldType.confirmPassword:
        if (value != widget.passwordController?.text) {
          return "Пароли не совпадают";
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.inputType == InputFieldType.password ||
        widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: isPassword && _hidePassword,
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: const TextStyle(
        fontFamily: "mononoki",
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontFamily: "mononoki",
          color: Colors.white70,
          fontSize: 16,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontFamily: "mononoki", color: Colors.white30),
        prefixIcon: widget.prefixIcon,
        filled: true,
        fillColor: Colors.black26,
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.greenAccent,
          ),
          onPressed: () {
            setState(() => _hidePassword = !_hidePassword);
          },
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.greenAccent, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      validator: _validator,
      textInputAction: widget.inputType == InputFieldType.confirmPassword
          ? TextInputAction.done
          : TextInputAction.next,
      onFieldSubmitted: (_) => widget.onFieldSubmitted?.call(),
    );
  }
}