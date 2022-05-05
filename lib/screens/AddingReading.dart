import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider_folder/Provider_Class.dart';

import '../widgets/Card_Adding_Reading.dart';

class AddingReading extends StatelessWidget {
  DocumentSnapshot customerObject;
  AddingReading(this.customerObject);

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controller_new_reading = TextEditingController();

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
              Text("تطبيق إدارة المولدات_إدخال قراءة",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              card("اسم الزبون", "${customerObject.get("name")}"),
              card("رقم الجوال", "${customerObject.get("phone_number")}"),
              card("الرصيد", "${customerObject.get("balance")}"),
              card("القراءة السابقة", "${customerObject.get("current_reading")}"),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                     textAlign: TextAlign.center,
                      controller: _controller_new_reading,
                      decoration: const InputDecoration(
                        hintText: "القراءة الجديدة",
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
                          return 'يجب عليك ادخال القراءة !';
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
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: MaterialButton(
                        color: Colors.deepOrangeAccent,
                        splashColor: Colors.orange,
                        child: Text(
                          "ادخال القراءة",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double newValue = double.parse(
                                _controller_new_reading.text.trim().toString());

                            DateTime now = new DateTime.now();
                            DateFormat formatter = new DateFormat('yyyy-MM-dd');
                            String date_now = formatter.format(now);
                            Provider.of<MyProvider>(context, listen: false)
                                .adding_reading_function(newValue, date_now, customerObject,context);

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
