import 'package:flutter/material.dart';



Widget circularProgressIndicator({required Color color}) {
  return SizedBox(
    height: 30,
    width: 30,
    child: CircularProgressIndicator(
      color: color,
    ),
  );
}
