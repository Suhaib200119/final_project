import 'package:final_project_flutter_iug/provider_folder/Provider_Class.dart';
import 'package:final_project_flutter_iug/screens/Login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
 await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
     create: (ctx){
      return MyProvider();

     },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  Login_Screen(),

      ),
    );
  }
}


