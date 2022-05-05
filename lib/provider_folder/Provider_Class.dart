import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/AlertDialog.dart';
class MyProvider  extends ChangeNotifier {

  bool notVisable=true;
  void changeValue(){
    notVisable=!notVisable;
    notifyListeners();
  }
// Initial Selected Value for name
  String dropdown_value_name = 'رامي';
  // List of items in our dropdown menu for names
  List<String> names = [
    'أحمد',
    'رامي',
    'محمود',
  ];
  void chageNameSelected(String nameSelected){
    dropdown_value_name=nameSelected;
    notifyListeners();

  }

  // Initial Selected Value for region
  String dropdown_value_region = 'مصبح';
  // List of items in our dropdown menu for regions
  List<String> regions = [
    'الشابورة',
    'مصبح',
    'السلطان',
  ];
  void chageRegionSelected(String regionSelected){
    dropdown_value_region=regionSelected;
    notifyListeners();

  }

  adding_reading_function(double new_reading , String lastDate , DocumentSnapshot customerObject,BuildContext ctx){
   if(new_reading>=customerObject.get("current_reading")){
     customerObject.reference.update(<String, dynamic>{
       "balance":customerObject.get("balance")!+
           (
               4*(new_reading-customerObject.get("current_reading"))
           ),
       "previous_reading":customerObject.get("current_reading"),
       "current_reading":new_reading,
       "last_read_date":lastDate,
     });
     notifyListeners();
     Navigator.pop(ctx);
   }else{
     showAlertDialog(ctx, "القيمة المدخلة غير صالحة ! يجب أن تكون أكبر من القراءة السابقة", "adding_reading");
   }

  }

  adding_money_function(double valueMoney ,  DocumentSnapshot customerObject,BuildContext ctx){
if(valueMoney>0 && valueMoney <=customerObject.get("balance")){
  customerObject.reference.update(<String, dynamic>{
    "balance":customerObject.get("balance")-valueMoney,
  });
  notifyListeners();
  Navigator.pop(ctx);
}else {
  showAlertDialog(ctx, "القيمة المدخلة غير صالحة ! يجب أن تكون أكبر من صفر , وأقل من من الرصيد المستحق", "adding_money");
}
  }

  adding_customer_function(String name, String phoneNumber){

    FirebaseFirestore.instance.collection("customers").add(
        {
          "name":name,
          "phone_number":phoneNumber,
          "name_region":dropdown_value_region,
          "name_employee":dropdown_value_name,
          "balance":0.0,
          "current_reading":0.0,
          "previous_reading":0.0,
          "last_read_date":"غير متوفر"

        }
    );
    notifyListeners();


  }

updateCustomer( DocumentSnapshot customerObject,BuildContext ctx,String newName,String newPhoneNumber){
  customerObject.reference.update(<String, dynamic>{
    "name":newName,
    "phone_number":newPhoneNumber,
    "name_employee":dropdown_value_name,
    "name_region":dropdown_value_region,
  });
  notifyListeners();
}

  delete_customer_function(DocumentSnapshot customerObject){
    FirebaseFirestore.instance.collection('customers').doc(customerObject.id).delete();
    notifyListeners();

  }
}
