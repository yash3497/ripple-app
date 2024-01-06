import 'package:flutter/material.dart';

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalySpace(double width) {
  return SizedBox(width: width);
}

BoxDecoration kShadowBoxDecoration(double radius) {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]);
}

// Gradient blackAndWhiteGrdient() {
//   return LinearGradient(
//     colors: [Colors.white.withOpacity(0.1), Color.fromRGBO(21, 21, 21, 1)],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   );
// }

// Gradient skyBlueGradient() {
//   return LinearGradient(
//     colors: [lightCyan, Color.fromRGBO(91, 190, 255, 1)],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );
// }

//box decoration with border colors only
BoxDecoration kOutlineBoxDecoration(double width, Color color, double radius) {
  return BoxDecoration(
    border: Border.all(width: width, color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

//box decoration with fill box colors
BoxDecoration kFillBoxDecoration(double width, Color color, double radius) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: width, color: Colors.grey.shade300),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}
