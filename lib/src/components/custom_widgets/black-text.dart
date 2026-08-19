import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//===========>>> Responsive Utility Class
class Responsive {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    screenHeight = size.height;
  }

  // Device type checks
  static bool get isMobile => screenWidth < 650;
  static bool get isTablet => screenWidth >= 650 && screenWidth < 1024;
  static bool get isDesktop => screenWidth >= 1024;

  //===========>>> Adaptive Font Size
  static double fontSize(double size) {
    if (isDesktop) {
      // Desktop / Web par fixed ya slight scaling
      return size;
    } else if (isTablet) {
      // Tablet par controlled scaling (1.1x - 1.2x)
      return size * 1.15;
    } else {
      // Mobile par 375 standard width se scale, bounded between 0.85x and 1.25x
      final scaleFactor = (screenWidth / 375).clamp(0.85, 1.25);
      return size * scaleFactor;
    }
  }

  //===========>>> Responsive Dimensions
  static double height(double value) {
    if (isDesktop) return value;
    return value * (screenHeight / 812).clamp(0.8, 1.2);
  }

  static double width(double value) {
    if (isDesktop) return value;
    return value * (screenWidth / 375).clamp(0.8, 1.2);
  }
}

//===========>>> Adaptive BlackText Widget
class BlackText extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final double? fontSize;
  final double? webFontSize; // Web ke liye custom font size (optional)
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
    this.webFontSize,
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
    Responsive.init(context);

    // Agar desktop/web ho aur webFontSize provide ki ho toh wo use karein
    double effectiveSize = 16.0;
    if (Responsive.isDesktop && webFontSize != null) {
      effectiveSize = webFontSize!;
    } else if (fontSize != null) {
      effectiveSize = Responsive.fontSize(fontSize!);
    } else {
      effectiveSize = Responsive.fontSize(16.0);
    }

    final textWidget = Text(
      text ?? "",
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.poppins(
        fontSize: effectiveSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: textColor ?? Colors.black,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: textWidget,
      );
    }

    return textWidget;
  }
}