
import 'package:flutter/material.dart';

Widget container_Button_Home_Screen({
  required String text,
  required BuildContext ctx,
  required Color backgroundColor,
  required Function? function
    })
{
  return Container(
    width: MediaQuery.of(ctx).size.width/1.5,
    height: 50,
    margin: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
         primary: backgroundColor,
      ),
        onPressed: (){ return function!();},
        child: Text("$text",style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),textAlign: TextAlign.center,)
    ),
  );
}