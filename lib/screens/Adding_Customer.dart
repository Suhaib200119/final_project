import 'dart:async';

import 'package:final_project_flutter_iug/screens/AddingReading.dart';
import 'package:final_project_flutter_iug/screens/Customer_Information.dart';
import 'package:final_project_flutter_iug/screens/Meter_Reading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_folder/Provider_Class.dart';



class Adding_Customer extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController tf_name = new TextEditingController();
  TextEditingController tf_phone_number = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("إضافة مشترك"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  new Image.asset("assets/images/Logo_Home_Screen.png"),
                  Text("تطبيق إدارة المولدات_إضافة مشترك جديد",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      height: 0.7,
                    ) ,
                    controller: tf_name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "اسم المشترك",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (String? inputUser){
                      if(inputUser!.trim().isEmpty){
                        return "يجب أن تدخل اسم المشترك";
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      height: 0.7,
                    ) ,
                    controller: tf_phone_number,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "الجوال",
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (String? inputUser){
                      if(inputUser!.trim().isEmpty){
                        return "يجب أن تدخل رقم جوال المشترك";
                      }
                    },
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
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepOrangeAccent,
                      ),
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("إضافة",style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                               String name=tf_name.text.trim().toString();
                               String phone_number=tf_phone_number.text.trim().toString();
                               Provider.of<MyProvider>(context,listen: false).adding_customer_function(name, phone_number);
                               ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                     backgroundColor: Colors.deepOrangeAccent,
                                     content: Text("تمت الإضافة بنجاح",textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 20),),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


