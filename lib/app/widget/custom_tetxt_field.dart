import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ripple_healthcare/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color fillColor;
  final bool isFill;
  final VoidCallback? onTap;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormater;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool readOnly;

  CustomTextField(
      {required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.isPassword = false,
      this.isFill = false,
      this.fillColor = AppColor.fillColor,
      this.controller,
      this.onTap,
      this.keyboardType,
      this.style,
      this.readOnly = false,
      this.inputFormater,
      this.validator,
      this.onChanged});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      inputFormatters: widget.inputFormater,
      style: widget.style,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.isFill,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.greenBorder)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.errorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColor.errorColor)),
        hintText: widget.hintText,
      ),
    );
  }
}
