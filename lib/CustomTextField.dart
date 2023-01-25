import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  late Icon i;
  String hint="";
  late TextInputType type;
  var textValueEditingController = TextEditingController();
  CustomTextField({required String s,required TextEditingController textValueEditingControlle,required Icon i,required TextInputType text}){
    this.hint=s;
    this.i=i;
    this.type=text;
    this.textValueEditingController=textValueEditingControlle;
  }
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
   String textValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8 , right: 8,top:40,bottom: 0),
        child: TextField(
          keyboardType: widget.type,
          controller: widget.textValueEditingController,
          onChanged: (text){
            setState(() {
              textValue=text;
            });
          },
          // style: TextStyle(backgroundColor: Colors.white),
          decoration:InputDecoration(
            focusColor: Colors.black,
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              hintText:widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: widget.i,
          ),

      ),
    );
  }
}