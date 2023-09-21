import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar({
  required String? content,
  required BuildContext context,
  required Color? backgroundColor,
}) {
  final snackbar = SnackBar(
    backgroundColor: backgroundColor,
    content: Text(
      content!,
      textAlign: TextAlign.center,
    ),
  );

  return ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
