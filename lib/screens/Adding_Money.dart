import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/Customers.dart';
import '../provider_folder/Provider_Class.dart';

import '../widgets/Card_Adding_Reading.dart';

class Adding_Money extends StatelessWidget {
  DocumentSnapshot customerObject;
  Adding_Money(this.customerObject);

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controller_value_money = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قراءة العداد"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              new Image.asset("assets/images/Logo_Home_Screen.png"),
              Text("تطبيق إدارة المولدات_إدخال دفعة مالية",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              card("اسم الزبون", "${customerObject.get("name")}"),
              card("تاريخ أخر قراءة", "${customerObject.get("last_read_date")}"),
              card("الرصيد", "${customerObject.get("balance")}"),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _controller_value_money,
                      decoration: const InputDecoration(
                        hintText: "إدخل قيمة الدفعة المالية",
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
                          return 'يجب عليك ادخال الدفعة المالية !';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: MaterialButton(
                        color: Colors.deepOrangeAccent,
                        splashColor: Colors.orange,
                        child: Text(
                          "ادخال الدفعة المالية",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double value_money = double.parse(
                                _controller_value_money.text.trim().toString());

                            Provider.of<MyProvider>(context, listen: false)
                                .adding_money_function(value_money, customerObject,context);

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
    );
  }
}
