import 'package:flutter/material.dart';

import '../screens/Customer_Information.dart';

showAlertDialog(BuildContext context, String contant, String type) {
  AlertDialog alert = AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "تنبيه",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        Icon(
          Icons.warning_rounded,
          color: Colors.amberAccent,
          size: 32,
        ),
      ],
    ),
    content: Text(
      "${contant}",
      textAlign: TextAlign.center,
    ),
    actions: [
      TextButton(
        child: Text("OK"),
        onPressed: () {
          if (type == "login") {
            Navigator.pop(context);
          } else if(type=="adding_money"){
            Navigator.pop(context);
          }else if(type=="adding_reading"){
            Navigator.pop(context);
          }
        },
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
