import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_flutter_iug/provider_folder/Provider_Class.dart';
import 'package:final_project_flutter_iug/widgets/Card_Collection_Reading_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Meter_Reading extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قراءة العداد"),
        backgroundColor:  Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("اسم المحصل",textAlign: TextAlign.center,
                      style: TextStyle(fontSize:20,fontStyle: FontStyle.italic ),),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),

                        ),
                        child: DropdownButton(
                          // Initial Value
                          value: Provider.of<MyProvider>(context,listen: false).dropdown_value_name,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
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
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("اسم المنطقة",textAlign: TextAlign.center,
                      style: TextStyle(fontSize:20,fontStyle: FontStyle.italic ),),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),

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
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                StreamBuilder(

                  stream: FirebaseFirestore.instance.collection("customers").snapshots(),
                    builder: (context,snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator());
                      }else if((snapshot.data! as QuerySnapshot).docs.length==0){
                        return Center(child: Text("لا يوجد بيانات"));
                      }else{
                        DateTime now=new DateTime.now();

                        List<DocumentSnapshot> list_docs = (snapshot.data! as QuerySnapshot).docs.where((element){
                        return  element.get("name_employee").toString()==Provider.of<MyProvider>(context).dropdown_value_name&&
                              element.get("name_region").toString()==Provider.of<MyProvider>(context).dropdown_value_region&&
                          element.get("last_read_date")!=now.toString().substring(0,10);
                        }).toList();
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                           separatorBuilder: (context,index){
                                    return SizedBox(
                                    height: 5,
                                    );
                                    },
                            itemBuilder: (context,index){
                                      return Card_Collection_Reading(list_docs[index],index,"M");
                            },

                            itemCount: list_docs.length
                        );
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
