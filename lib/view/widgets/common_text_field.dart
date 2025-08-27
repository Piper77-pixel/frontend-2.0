import 'package:brain_bucks/utils/app_globals.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final bool? autocorrect;
  final Function(String v)? validator;
  final bool? readOnly;
  final String? labelText;
  final String? hintText;
  final String? prefix;
  final Widget? suffix;
  final Widget? prefixWidget;
  final String? obscuringCharacter;
  final int? maxLines;
  final int? maxLength;
  final Color? bColor;
  final Color? textColor;
  final Color? filledColor;
  final Color? cursorColor;
  final bool? isFilledColor;
  final bool? isText;
  final double? bottom;

  const CommonTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.readOnly = false,
    this.enabled = false,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.onChanged,
    this.obscuringCharacter,
    this.onTap,
    this.validator,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.maxLines = 1,
    this.maxLength,
    this.bColor,
    this.filledColor,
    this.isFilledColor,
    this.textColor,
    this.cursorColor,
    this.isText = false,
    this.prefixWidget,
    this.bottom,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final TextAlign textAlign = TextAlign.start;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    setState(() {});
  }

  String err = '';
  double radius = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom ?? 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: 56,
            // decoration: BoxDecoration(
            //   color: AppColors.kTextField,
            //   border: !_focus.hasFocus
            //       ? GradientBoxBorder(
            //           gradient: LinearGradient(
            //             colors: [AppColors.cBorder, AppColors.kWhite.withOpacity(0.0)],
            //             begin: Alignment.topCenter,
            //             end: Alignment.bottomCenter,
            //           ),
            //           width: 1,
            //         )
            //       : Border.all(color: AppColors.kThemeColor),
            //   borderRadius: BorderRadius.circular(radius),
            // ),
            child: TextFormField(
              controller: widget.controller,
              cursorColor: widget.cursorColor ?? AppColors.kThemeColor,
              autofocus: widget.autofocus ?? false,
              focusNode: _focus,
              // enabled: widget.enabled,
              readOnly: widget.readOnly ?? false,
              validator: (v) {
                showMessage("vv======= $v");

                setState(() {
                  err = widget.validator!(v!);
                });
                showMessage("======= $err");
                if (err == '') {
                  return null;
                } else {
                  return err;
                }
              },
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              obscureText: widget.obscureText ?? false,
              maxLines: widget.maxLines ?? 1,
              maxLength: widget.maxLength,
              obscuringCharacter: widget.obscuringCharacter ?? ' ',
              keyboardType: widget.keyboardType,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
              style: widget.obscureText == true
                  ? TextStyle(color: widget.textColor ?? AppColors.kFont, fontFamily: 'Roboto')
                  : pLatoSemiBold10.copyWith(color: widget.textColor ?? AppColors.kFont, fontSize: 14),
              decoration: InputDecoration(
                fillColor: widget.filledColor ?? AppColors.kTextField,
                filled: widget.isFilledColor ?? true,
                hintText: widget.hintText,
                labelStyle: pLatoRegular10.copyWith(color: widget.textColor ?? AppColors.kLabel),
                hintStyle: pLatoSemiBold10.copyWith(color: widget.textColor ?? AppColors.cHintTxt, fontSize: 14),
                counterText: '',
                errorStyle: TextStyle(height: 0, fontSize: 0, decorationThickness: 0),
                counterStyle: TextStyle(height: 0, fontSize: 0, decorationThickness: 0),
                prefixIcon: widget.isText == true
                    ? Padding(padding: const EdgeInsets.only(left: 8.0), child: widget.prefixWidget)
                    : widget.prefix == null
                    ? SizedBox()
                    : Image.asset(widget.prefix!, color: AppColors.kThemeFont),
                suffixIcon: widget.suffix,
                prefixIconConstraints: widget.isText == true ? BoxConstraints() : BoxConstraints(maxWidth: widget.prefix == null ? 10 : 35, minWidth: widget.prefix == null ? 10 : 32),
                suffixIconConstraints: BoxConstraints(maxWidth: 40, minWidth: 35),
                contentPadding: EdgeInsets.symmetric(vertical: widget.maxLines == 1 ? 0 : 16, horizontal: 10),
                prefixText: ' ',
                // border: InputBorder.none,
                border: GradientOutlineInputBorder(
                  gradient: LinearGradient(colors: AppColors.linerTextFieldBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  width: 1,
                  borderRadius: BorderRadius.circular(radius),
                ),
                enabledBorder: GradientOutlineInputBorder(
                  gradient: LinearGradient(colors: AppColors.linerSelectedTextFieldBorderColor, begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  width: 1,
                  borderRadius: BorderRadius.circular(radius),
                ),
                errorBorder: GradientOutlineInputBorder(
                  gradient: LinearGradient(colors: [AppColors.cBorder, AppColors.kWhite.withOpacity(0.0)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  width: 1,
                  borderRadius: BorderRadius.circular(radius),
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(radius),
                //   borderSide: BorderSide(color: widget.bColor ?? AppColors.cBorder, width: 1),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(radius),
                //   borderSide: BorderSide(color: widget.bColor ?? AppColors.cBorder, width: 1),
                // ),
                // errorBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(radius),
                //   borderSide: BorderSide(color: widget.bColor ?? AppColors.cBorder),
                // ),
                // disabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(radius),
                //   borderSide: BorderSide(color: widget.bColor ?? AppColors.cBorder, width: 1),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color: widget.bColor ?? AppColors.kThemeColor, width: 1),
                ),
              ),
            ),
          ),
          err == '' ? SizedBox(height: 0) : Text(err, style: pLatoMedium10.copyWith(color: AppColors.kRed, fontSize: 12)),
        ],
      ),
    );
  }
}
