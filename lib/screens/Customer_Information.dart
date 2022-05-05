import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_flutter_iug/screens/Adding_Customer.dart';
import 'package:final_project_flutter_iug/screens/Update_Customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Card_Show_Cusomer.dart';

class Customer_Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المشتركين"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("customers").snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
            }else if((snapshot.data! as QuerySnapshot).docs.length==0){
                return Center(child: Text("لا يوجد بيانات"));
            }else{
                List<DocumentSnapshot> list_docs = (snapshot.data! as QuerySnapshot).docs;
                return   ListView.builder(
                itemCount: list_docs.length,
                itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                        return Update_Customer(
                            list_docs[index],
                        );
                      })
                      );
                    },
                      child: cardShowCustomer(context,list_docs[index],index)
                  ),
                );
                },
                );
            }
          }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add,color: Colors.deepOrangeAccent,size: 32,),
       onPressed: (){
         Navigator.pushReplacement(context, MaterialPageRoute(
             builder: (context){
               return Adding_Customer();
             }
             ),
         );
       },
      ),
    );
  }
}
