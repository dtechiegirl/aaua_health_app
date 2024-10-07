

import 'package:aauahealthapp/src/constant/colors.dart';
import 'package:flutter/material.dart';

class formFieldWidget extends StatelessWidget {
  const formFieldWidget({
    super.key, this.hintText, this.email, this.password, this.cpassword, this.textInputType, required this.obscureText,  this.validator, this.onSaved, this.controller,
  });

final String? hintText;
final String? email;
final String? password;
final String? cpassword;
final String? Function(String?)? validator;
final void Function(String?)? onSaved;
final TextInputType? textInputType;
final TextEditingController? controller;
final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.deepRed, width: 1.5)),
             focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.deepRed, width: 1.5)),
        // label: Text("Enter Student ID"),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.borderColor, width: 1.5)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1.5),
          
          
        ),
      ),
      keyboardType: textInputType,
      obscureText: obscureText ,
      validator: validator,
      controller: controller,
    );
  }
}
