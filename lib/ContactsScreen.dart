import 'package:contacts_project/CustomTextField.dart';
import 'package:contacts_project/NameWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget{
  bool isVisible = false;
  List<contacts> contactsList =[];
  static const String routeName = "Contacts";
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Contacts Screen"),
        centerTitle: true,

      ),
      body: Column(
        children:  [
          CustomTextField(s: "Enter Your Name Here",textValueEditingControlle: widget.nameController,i: Icon(Icons.mode_edit_outlined),text: TextInputType.text,),
          CustomTextField(s: "Enter Your Number Here",textValueEditingControlle: widget.numberController,i: Icon(Icons.call),text: TextInputType.number,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.isVisible=true;
                    if(widget.contactsList.length<3){
    contacts obj = new contacts(widget.nameController.text, widget.numberController.text);
    widget.contactsList.add(obj);}
                  });;
                },
                style: ButtonStyle(

                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10,horizontal: 70)),
                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18))),
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  for(int i=0;i<widget.contactsList.length;i++){
                    if(widget.contactsList[i].name==widget.nameController.text&&widget.contactsList[i].number==widget.numberController.text){
                      widget.contactsList.removeAt(i);
                      setState(() {
                        if(widget.contactsList.isEmpty){
                          widget.isVisible=false;
                        }
                      });
                    }
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10,horizontal: 70)),
                    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18))),
                child: const Text('Delete'),
              ),
            ],
            // ListView.builder(itemBuilder: (_, pos) => NameWidget(name: name, number: number)
            //   , itemCount: stories.length,
            //   scrollDirection: Axis.horizontal,),
          ),
          Visibility(

            visible: widget.isVisible,

            child: Expanded(
              child: ListView.builder(itemBuilder: (_, pos) => NameWidget(name: widget.contactsList[pos].name, number: widget.contactsList[pos].number),
                    itemCount: widget.contactsList.length,
                 scrollDirection: Axis.vertical,),
            ),
            // replacement: Container(
            //
            //   height: 200,
            //
            //   width: 300,
            //
            //   color: Colors.red,
            //
            // ),

          )
        ],
      ),
    );
  }
}
class contacts{
  String name= "";
  String number="";
  contacts(String name,String number){
    this.name=name;
    this.number=number;
  }
}

