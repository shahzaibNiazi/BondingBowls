import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String? title, family;
  final FontWeight? weight;
  final double? size;
  final Color? clr;
  final Color? decorationColor;
  final bool? lineThrough;
  final bool? underLine;
  final int? line;
  final TextDecoration? textDecoration;
  final double? lineThikness;
  final bool isSatoshi;
  final TextAlign? textAlign;
  final Paint? bgColor;
  final double? letterSpacing;
  final double? wordsSpacing;
  final TextOverflow? overFLow;
  final TextDirection? textDirection;

  const MyText({
    super.key,
    this.title,
    this.textDecoration,
    this.underLine,
    this.size,
    this.isSatoshi = true,
    this.clr,
    this.textDirection,
    this.overFLow,
    this.weight,
    this.family,
    this.bgColor,
    this.lineThrough = false,
    this.line,
    this.letterSpacing,
    this.wordsSpacing,
    this.textAlign,
    this.decorationColor,
    this.lineThikness,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = isSatoshi
        ? TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: weight,
            fontSize: size,
            wordSpacing: wordsSpacing,
            letterSpacing: letterSpacing,
            color: clr,
            decorationColor: decorationColor,
            decoration: underLine == true
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationThickness: lineThrough == true ? lineThikness : null,
          )
        : GoogleFonts.inriaSans(
            fontWeight: weight,
            fontSize: size,
            wordSpacing: wordsSpacing,
            letterSpacing: letterSpacing,
            color: clr,
            decoration: TextDecoration.none,
          );

    return Text(
      title!,
      textDirection: textDirection ?? TextDirection.ltr,
      maxLines: line,
      softWrap: true,
      overflow: overFLow,
      style: textStyle,

      textAlign: textAlign,
    );
  }
}
