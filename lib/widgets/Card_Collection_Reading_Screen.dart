import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Customers.dart';
import '../screens/AddingReading.dart';
import '../screens/Adding_Money.dart';

class Card_Collection_Reading extends StatelessWidget {
  DocumentSnapshot customerObject;
  int indexCard;
  String type;
  Card_Collection_Reading(this.customerObject,this.indexCard,this.type);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)  {
            if(type=="M"){
              return AddingReading(customerObject);
            }else{
              return Adding_Money(customerObject);
            }
          }),
        );
      },
      child:Card(
        elevation: 3,
        shadowColor: Colors.lime,

        child: Container(
          width: MediaQuery.of(context).size.width/1.5,
          height: 250,
          padding: EdgeInsets.only(right: 2),
          decoration: BoxDecoration(
            color: Colors.amberAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(5),

          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("اسم الزبون : ${customerObject.get("name")}",style: TextStyle(fontSize: 17),),
                 Text("الجوال: ${customerObject.get("phone_number")}",style: TextStyle(fontSize: 18),),
                 Text("تاريخ أخر قراءة : ${customerObject.get("last_read_date")}",style: TextStyle(fontSize: 18),),
                 Text("القراءة السابقة : ${customerObject.get("previous_reading")}",style: TextStyle(fontSize: 18),),
                 Text("القراءة الحالية: ${customerObject.get("current_reading")}",style: TextStyle(fontSize: 18),),
                 Text("الرصيد : ${customerObject.get("balance")}",style: TextStyle(fontSize: 18),),
               ],
             ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  type=="M" ? Image.asset("assets/images/icon_meter_reading.png",width: 120,height: 150,):Image.asset("assets/images/credit.png",width: 120,height: 150,),
                  Text("${++indexCard}"),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
