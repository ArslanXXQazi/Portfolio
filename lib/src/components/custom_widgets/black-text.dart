import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//===========>>> Utility class for responsive dimensions
class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _baseFontSize;

  //===========>>> Initialize with BuildContext
  static void init(BuildContext context) {
    _screenWidth = MediaQuery.sizeOf(context).width;
    _screenHeight = MediaQuery.sizeOf(context).height;
    _baseFontSize = 16; // Base font size for scaling
  }

  //===========>>> Get responsive font size
  static double fontSize(double size) {
    return size *
        (_screenWidth / 375); // Scale based on 375px width (standard mobile)
  }

  //===========>>> Get responsive height
  static double height(double value) {
    return value * (_screenHeight / 750); // Scale based on 750px height
  }

  //===========>>> Get responsive width
  static double width(double value) {
    return value * (_screenWidth / 375); // Scale based on 375px width
  }
}

class BlackText extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? letterSpacing;

  const BlackText({
    super.key,
    this.text,
    this.onTap,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    //===========>>> Initialize Responsive utility
    Responsive.init(context);

    return InkWell(
      //===========>>> Tappable text container
      onTap: onTap,
      child: Text(
        //===========>>> Display text or empty string
        text ?? "",
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.poppins(
          //===========>>> Responsive font size
          fontSize: fontSize != null
              ? Responsive.fontSize(fontSize!)
              : Responsive.fontSize(16), // Default font size scaled
          fontWeight: fontWeight ?? FontWeight.w500,
          color: textColor ?? Theme.of(context).textTheme.bodyMedium?.color,
          height: height,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}