import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showMessage({required String msg, required Color color}) {
  Fluttertoast.showToast(
      msg: msg, backgroundColor: color, gravity: ToastGravity.BOTTOM);
}
