import 'package:contacts_project/ContactsScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Contacts App",
      routes: {
        ContactsScreen.routeName:(_)=>ContactsScreen(),
      },
      initialRoute: ContactsScreen.routeName,

    );
  }
}