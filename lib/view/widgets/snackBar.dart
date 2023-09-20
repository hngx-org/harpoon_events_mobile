import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar({
  required String? content,
  required BuildContext context,
  required Color? backgroundColor,
}) {
  final snackbar = SnackBar(
    backgroundColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 100,
      right: 20,
      left: 20,
    ),
    content: Text(
      content!,
      textAlign: TextAlign.center,
    ),
  );

  return ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
