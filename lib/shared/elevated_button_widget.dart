import 'package:flutter/material.dart';

class PElevatedButton extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? textFontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onClick;
  final double? borderRadius;
  final double? padding;
  final double? buttonHeight;
  final FontWeight? fontWeight;
  final bool isTextBold;

  const PElevatedButton(
      {Key? key,
      required this.text,
      this.fontFamily,
      this.textFontSize,
      this.fontWeight,
      this.isTextBold = false,
      this.backgroundColor,
      this.textColor,
      this.borderRadius,
      this.padding,
      this.buttonHeight,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: textColor,
        primary: backgroundColor,
        minimumSize: Size.fromHeight(buttonHeight ?? 44),
        padding: EdgeInsets.all(padding ?? 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
        ),
      ),
      onPressed: () {
        onClick!.call();
      },
      child: Text(text,
          style: TextStyle(
            fontFamily: fontFamily ?? 'Roboto',
            fontSize: textFontSize,
            fontWeight: isTextBold ? FontWeight.w700 : FontWeight.w400,
          )),
    );
  }
}
