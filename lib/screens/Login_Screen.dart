import 'package:animate_do/animate_do.dart';
import 'package:final_project_flutter_iug/provider_folder/Provider_Class.dart';
import 'package:final_project_flutter_iug/screens/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/AlertDialog.dart';

class Login_Screen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _controller_email = TextEditingController();
  TextEditingController _controller_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(//حتى يظهر الشريط العلوي الذي يكون فيه بعض المعلومات مثل الساعة والبطارية
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: MediaQuery.of(context).size.width,//هنا جعلنا عرض الشاشة تأخذ عرض الجوال بغض النظر عن نوعه وعرضه
            height: MediaQuery.of(context).size.height,//هنا جعلنا طول الشاشة تأخذ طول الجوال بغض النظر عن نوعه وطوله
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(child:Image.asset("assets/images/Logo_Home_Screen.png"),duration: Duration(seconds: 2)),
                      new Text("تطبيق إدارة المولدات",style: TextStyle(
                        fontSize: 24,
                        wordSpacing:1.5,
                      ),),
                      new Text("V1.1"),
                      Form(
                          key: _formKey,
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                FadeInLeftBig(child: TextFormField(
                                  controller: _controller_email,
                                  decoration: const InputDecoration(
                                    hintText:"البريد الإلكتروني" ,
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),

                                    ),
                                    focusedBorder:OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),

                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (String? value){
                                    if(value!.trim().isEmpty){
                                      return ' البريد الإلكتروني مطلوب !';

                                    }
                                  },
                                ),duration: Duration(seconds: 2),),
                                SizedBox(height: 10,),
                                FadeInRightBig(child: TextFormField(
                                  controller: _controller_password,
                                  decoration:  InputDecoration(
                                    fillColor: Colors.red,
                                    hintText:"كلمة المرور" ,
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      onPressed: (){
                                        Provider.of<MyProvider>(context,listen: false).changeValue();
                                      },
                                      icon: Provider.of<MyProvider>(context,listen: false).notVisable?Icon(Icons.visibility):Icon(Icons.visibility_off),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    focusedBorder:OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText:  Provider.of<MyProvider>(context).notVisable,
                                  validator: (String? value){
                                    if(value!.trim().isEmpty){
                                      return 'كلمة المرور مطلوبة !';

                                    }
                                  },
                                ),duration: Duration(seconds: 2),),
                                SizedBox(height: 10,),
                                SizedBox(height: 10,),
                                FadeInDown (child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                  ),
                                  width: MediaQuery.of(context).size.width/1.5,
                                  child: MaterialButton(
                                    color: Colors.deepOrangeAccent,
                                    splashColor: Colors.orange,
                                    child: Text(
                                      "دخول",style:  TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                    ),
                                    ),
                                    onPressed: () async{
                                      if(_formKey.currentState!.validate()){
                                        String email=_controller_email.text.toString().toLowerCase();
                                        String password=_controller_password.text.toString().toLowerCase();
                                        FirebaseAuth auth=  FirebaseAuth.instance;
                                        UserCredential result;
                                        showDialog(context: context, builder: (context){

                                          return  AlertDialog(
                                            content: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CircularProgressIndicator(),
                                                Text("جاري التحميل",style: TextStyle(color: Colors.grey,fontSize: 24),)
                                              ],
                                            ),
                                          );
                                        });
                                        try{
                                          result=  await auth.signInWithEmailAndPassword(email: email, password: password);

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context)  {return Home_Screen();}),
                                          );



                                        }on FirebaseAuthException catch(exception){
                                          showAlertDialog(context,"يوجد خطأ في اسم المستخدم أوكلمة المرور","login");
                                        }
                                      }
                                      FocusScope.of(context).unfocus();


                                    },

                                  ),
                                ),duration: Duration(seconds: 2),),
                              ],
                            ),
                          )
                      ),
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}
// onPressed: (){
// if(_formKey.currentState!.validate()){
// String username=_controller_username.text.toString().toLowerCase();
// String password=_controller_password.text.toString().toLowerCase();
// if(
// username==Provider.of<MyProvider>(context, listen: false).username
// &&
//
// password==Provider.of<MyProvider>(context, listen: false).password
// ){
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(builder: (context)  {return Home_Screen(username, password);}),
// );
// }else{
// showAlertDialog(context);
// }
//
// }
//
// },