import 'package:flutter/material.dart';

class Responsive {
  static double lebar(BuildContext context) => MediaQuery.of(context).size.width;
  static double tinggi(BuildContext context) => MediaQuery.of(context).size.height;
  static bool isMobile(BuildContext context) => lebar(context) < 600;
  static bool isTablet(BuildContext context) => lebar(context) >= 600 && lebar(context) < 1024;
  static bool isDesktop(BuildContext context) => lebar(context) >= 1024;

  static double paddingHorizontal(BuildContext context) {
    if (isDesktop(context)) return 48;
    if (isTablet(context)) return 32;
    return 20;
  }

  static double maxContentWidth(BuildContext context) {
    if (isDesktop(context)) return 800;
    if (isTablet(context)) return 600;
    return double.infinity;
  }

  static double fontSizeJudul(BuildContext context) {
    if (isDesktop(context)) return 22;
    if (isTablet(context)) return 20;
    return 18;
  }

  static double spacing(BuildContext context) {
    if (isDesktop(context)) return 24;
    if (isTablet(context)) return 20;
    return 16;
  }
}
