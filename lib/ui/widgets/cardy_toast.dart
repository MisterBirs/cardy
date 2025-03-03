import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class  CardyToast {
  static void show(String msg) {
    Fluttertoast.showToast(
                    msg: msg,
                    toastLength: Toast.LENGTH_LONG, // או Toast.LENGTH_LONG
                    gravity:
                        ToastGravity.BOTTOM, 
                    backgroundColor: const Color.fromARGB(230, 38, 38, 38),
                    textColor: Colors.white,
                    fontSize: 20.0,
                  );
  }
  
}