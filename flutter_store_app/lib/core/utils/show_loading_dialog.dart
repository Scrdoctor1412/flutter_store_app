import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: CircularProgressIndicator(),
    ),
  );
}
