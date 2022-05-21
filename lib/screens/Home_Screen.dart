import 'package:animate_do/animate_do.dart';
import 'package:final_project_flutter_iug/screens/Credit_Collection.dart';
import 'package:flutter/material.dart';

import '../widgets/Button_Home_Screen.dart';
import 'Customer_Information.dart';
import 'Meter_Reading.dart';

class Home_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, //هنا جعلنا عرض الشاشة تأخذ عرض الجوال بغض النظر عن نوعه وعرضه
          height: MediaQuery.of(context)
              .size
              .height, //هنا جعلنا طول الشاشة تأخذ طول الجوال بغض النظر عن نوعه وطوله
        alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               FadeInDownBig(child: Image.asset("assets/images/Logo_Home_Screen.png"),duration: Duration(seconds: 2),),
               FadeInUpBig(child:  Text(" مرحباً بك في تطبيق إدارة المولدات",
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                 duration: Duration(seconds: 2),),
                SizedBox(
                  height: 10,
                ),
                FadeInLeftBig(child: container_Button_Home_Screen(
                    text: "قراءة العداد",
                    backgroundColor: Colors.orangeAccent,
                    ctx: context,
                    function: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Meter_Reading();
                          }));
                    }),duration: Duration(seconds: 2),),
                FadeInRightBig(child: container_Button_Home_Screen(
                    text: "تحصيل الأرصدة",
                    backgroundColor: Colors.blueAccent,
                    ctx: context,
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Credit_Collection();
                        }),
                      );
                    }),duration: Duration(seconds: 2),),
               FadeInLeftBig(child:  container_Button_Home_Screen(
                   text: "المشتركين",
                   backgroundColor: Colors.redAccent,
                   ctx: context,
                   function: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) {
                         return Customer_Information();
                       }),
                     );
                   }),duration: Duration(seconds: 2),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
