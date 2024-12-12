import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowCustomToasts {
  static alertToast(BuildContext context, String message) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Theme.of(context).colorScheme.error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
