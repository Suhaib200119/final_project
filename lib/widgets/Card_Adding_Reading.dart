import 'package:flutter/material.dart';

Widget card(String label, String value) {
  return Container(
    width: double.infinity,
    height: 50,
    margin: EdgeInsets.only(bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(value,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
