import 'package:flutter/material.dart';

class UI {
  // Adapt design width to the actual UI
  // mobile width on figma design = 428
  static double width(BuildContext context, double givenWidth) =>
      (MediaQuery.of(context).size.width / 428) * givenWidth;

  // Adapt design height to the actual UI
  // mobile height on figma design = 926
  static double height(BuildContext context, double givenHeight) =>
      (MediaQuery.of(context).size.height / 926) * givenHeight;
}

// Using these static methods will allow us to transfer the dimensions on the design
// directly on to the app