import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/styles_manager.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String preIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool isSearch;
  final ValueNotifier<bool>? hasTextNotifier;
  final Function(String)? onChanged;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.preIcon,
    this.validator,
    this.suffixIcon,
    this.isPassword = false,
    this.isSearch = false,
    this.hasTextNotifier,
    this.onChanged,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    if (widget.isSearch && widget.hasTextNotifier != null) {
      widget.controller.addListener(() {
        widget.hasTextNotifier!.value = widget.controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        cursorColor: AppColors.myWhite,
        controller: widget.controller,
        obscureText: widget.isPassword ? isObscure : false,
        style: StylesManager.white16W500Inter,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.myGray,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: AppColors.myWhite, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: AppColors.myWhite, width: 1.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: AppColors.myWhite, width: 1.w),
          ),
          prefixIcon: ImageIcon(
            AssetImage(widget.preIcon),
            size: 25,
            color: AppColors.myWhite,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.myWhite,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )
              : widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: StylesManager.white16W400Inter,
        ),
        validator: widget.validator,
      ),
    );
  }
}
