import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider_folder/Provider_Class.dart';
import 'Customer_Information.dart';

class Update_Customer extends StatelessWidget {
 DocumentSnapshot customerObject;
 Update_Customer(this.customerObject);


  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController new_name = TextEditingController();
  TextEditingController new_phone_number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تحديث بيانات"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                new Image.asset("assets/images/Logo_Home_Screen.png"),
                Text("تطبيق إدارة المولدات_تحديث بيانات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: new_name,
                        decoration: const InputDecoration(
                          hintText: "الأسم الجديد",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'يجب عليك إدخال قيمة !';
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: new_phone_number,
                        decoration: const InputDecoration(
                          hintText: "رقم الجوال الجديد",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value!.trim().isEmpty) {
                            return 'يجب عليك إدخال قيمة !';
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton(
                          // Initial Value
                          value: Provider.of<MyProvider>(context,listen: false).dropdown_value_name,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down,),
                          // Array list of items
                          items: Provider.of<MyProvider>(context).names.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? name_selected) {
                            Provider.of<MyProvider>(context,listen: false).chageNameSelected(name_selected!);

                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton(
                          // Initial Value
                          value: Provider.of<MyProvider>(context,listen: false).dropdown_value_region,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: Provider.of<MyProvider>(context).regions.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? region_selected) {
                            Provider.of<MyProvider>(context,listen: false).chageRegionSelected(region_selected!);
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: MaterialButton(
                          color: Colors.deepOrangeAccent,
                          splashColor: Colors.orange,
                          child: Text(
                            "تحديث البيانات",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String newValue = new_name.text.trim().toString();
                              String newPhoneNumber = new_phone_number.text.trim().toString();

                              Provider.of<MyProvider>(context, listen: false).
                                updateCustomer(customerObject, context,newValue,newPhoneNumber);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    content: Text("تم التحديث بنجاح",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 20),),
                                    duration: Duration(seconds: 2),
                                  )
                              );
                              Timer timer=new Timer(Duration(seconds: 3), (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Customer_Information();
                                  }),
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
