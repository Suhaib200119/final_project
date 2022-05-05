import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_flutter_iug/models/Customers.dart';
import 'package:final_project_flutter_iug/provider_folder/Provider_Class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget cardShowCustomer(BuildContext ctx , DocumentSnapshot customerObject , int indexCard){
  return  Container(
    width: MediaQuery.of(ctx).size.width/1.5,
    height: 320,
    padding: EdgeInsets.only(right: 2),
    decoration: BoxDecoration(
      color: Colors.amberAccent.withOpacity(0.8),
      borderRadius: BorderRadius.circular(5),

    ),
    child:  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("اسم الزبون : ${customerObject.get("name")}",style: TextStyle(fontSize: 17),),
                Text("الجوال: ${customerObject.get("phone_number")}",style: TextStyle(fontSize: 18),),
                Text("اسم المحصل : ${customerObject.get("name_employee")}",style: TextStyle(fontSize: 18),),
                Text("اسم المنطقة: ${customerObject.get("name_region")}",style: TextStyle(fontSize: 18),),
                Text("تاريخ اخر قراءة : ${customerObject.get("last_read_date")}",style: TextStyle(fontSize: 18),),
                Text("القراءة السابقة : ${customerObject.get("previous_reading")}",style: TextStyle(fontSize: 18),),
                Text("القراءة الحالية: ${customerObject.get("current_reading")}",style: TextStyle(fontSize: 18),),
                Text("الرصيد : ${customerObject.get("balance")}",style: TextStyle(fontSize: 18),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/person.png",width: 120,height:150,),
                Text("${++indexCard}"),
              ],
            ),
          ],
        ),
        IconButton(onPressed: (){
          Provider.of<MyProvider>(ctx,listen: false).delete_customer_function(customerObject);
        }, icon: Icon(Icons.delete,size: 30,color: Colors.white,))
      ],
    ),
  );
}