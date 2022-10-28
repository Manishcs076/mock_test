// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
///DefaultTextFormField - custom textformfield for reusability
// ignore: must_be_immutable
class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField(
      {Key? key,
      this.onEditingComplete,
      this.textEditingController,
      this.inputFormatters,
      this.onChange,
      this.textInputAction,
      this.prefix,
      this.validator,
      this.errorBorder,
      required this.autofocus,
      required this.cursorColor,
      required this.maxLength,
      required this.hintText,
      required this.enabledBorderColor,
      required this.focusedBorderColor,
      required this.keyBoardType,
      required this.textCapitalization,
      required this.fillColor,
      this.prefixIcon,
      this.contentPadding,
      this.textAlign})
      : super(key: key);

  TextEditingController? textEditingController;
  Color? cursorColor;
  int? maxLength;
  String hintText;
  Color enabledBorderColor;
  Color focusedBorderColor;
  Color fillColor;
  TextInputType keyBoardType;
  TextCapitalization textCapitalization;
  TextInputAction? textInputAction;
  Function(String)? onChange;
  List<TextInputFormatter>? inputFormatters;
  Widget? prefix;
  String? Function(String?)? validator;
  InputBorder? errorBorder;
  bool autofocus;
  Function()? onEditingComplete;
  TextAlign? textAlign;
  EdgeInsetsGeometry? contentPadding;
  Widget? prefixIcon;

  @override
  _DefaultTextFormFieldState createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlign ?? TextAlign.start,
      onEditingComplete: widget.onEditingComplete,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyBoardType,
      autofocus: widget.autofocus,
      controller: widget.textEditingController,
      autovalidateMode: AutovalidateMode.always,
      //Colors.red,
      cursorColor: widget.cursorColor,
      // controller: _leadGatepassIdController,
      textCapitalization: widget.textCapitalization,
      onChanged: widget.onChange,
      //11

      maxLength: widget.maxLength,
      style: TextStyle(
        fontSize: 18.sp,
        color: const Color.fromARGB(
          204,
          18,
          18,
          18,
        ),
        fontWeight: FontWeight.w600,
      ),
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        // suffixIcon: widget.suffixIcon,

        filled: true,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        fillColor: widget.fillColor,
        counterText: '',
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: const Color.fromARGB(
            204,
            86,
            87,
            86,
          ),
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0).r,
          borderSide: BorderSide(
            // ignore: use_full_hex_values_for_flutter_colors
            color: widget.focusedBorderColor,
            //Color(0xffc1c1c1cc),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0).r,
          borderSide: BorderSide(
            // ignore: use_full_hex_values_for_flutter_colors
            color: widget.enabledBorderColor,
            //Color(0xffc1c1c1cc),
            width: 1.0.r,
          ),
        ),
        errorBorder: widget.errorBorder,
      ),
    );
  }
}
