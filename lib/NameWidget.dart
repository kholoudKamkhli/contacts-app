import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget{
  String name ;
  String number;
  NameWidget({required this.name,required this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12,bottom: 12,left: 7,right: 7),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
          Row(
            children: [
              Icon(Icons.person_pin_outlined,color: Colors.grey,size: 50,),
              SizedBox(width: 10,),
      Text("Name : $name \nNumber : $number",style: TextStyle(
        fontSize: 20,color: Colors.black))
            ]
          ),
    );
  }
}