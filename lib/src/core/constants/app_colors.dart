import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color blue = Colors.blue;
  static const Gradient bg = LinearGradient(
    colors: [Color(0xff606c38), Color(0xff283618)],
  );
  static const Gradient vg = LinearGradient(
    colors: [Color(0xffe9edc9), Color(0xfffefae0)],
  );
  static const Gradient fade = LinearGradient(
    begin: AlignmentGeometry.topCenter,
    end: AlignmentGeometry.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.transparent,
      Color(0xCC000000),
      Color(0xff000000),
    ],
  );
  static const Color appblack = Color(0xff141006);
}
