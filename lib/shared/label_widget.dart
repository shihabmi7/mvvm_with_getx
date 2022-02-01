import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  double? size;
  FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final VoidCallback? onClick;

  CustomLabel(
      {Key? key,
      required this.text,
      this.size,
      this.fontWeight,
      this.color,
      this.wordSpacing,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: onClick == null
            ? Text(
                text,
                style: TextStyle(
                  fontSize: size ?? 16,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  color: color ?? Colors.grey,
                  wordSpacing: wordSpacing,
                ),
              )
            : TextButton(
                onPressed: () {
                  onClick!.call();
                },
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: fontWeight,
                    color: color,
                    wordSpacing: wordSpacing,
                  ),
                )));
  }
}
