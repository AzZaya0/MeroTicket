import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CTextFormFiled extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? obscureText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool? enableIMEPersonalizedLearning;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;

  const CTextFormFiled({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.enableIMEPersonalizedLearning = true,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      enableSuggestions: enableSuggestions!,
      autocorrect: autocorrect!,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning!,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintTextDirection: TextDirection.ltr,
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 10,
          maxWidth: 10,
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
    );
  }
}

class CPasswordFormField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool enableIMEPersonalizedLearning;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;

  const CPasswordFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    this.obscureText = true,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.enableIMEPersonalizedLearning = false,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
  }) : super(key: key);

  @override
  State<CPasswordFormField> createState() => _CPasswordFormFieldState();
}

class _CPasswordFormFieldState extends State<CPasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintTextDirection: TextDirection.ltr,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
            size: 17.0,
            color: Colors.black,
          ),
        ),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
    );
  }
}
