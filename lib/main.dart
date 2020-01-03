import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Form Validation",
      home: GetWidget(),
    )
  );
}

class GetWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _getWidgetState();
  }

}

class _getWidgetState extends State<GetWidget>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Form Validation Practice"),),
      body: Column( children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Phone Number",
              hintText: "e.g.01717366350"
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Email address",
              hintText: "e.g.tom123@gmail.com"
          ),
        ),
        RaisedButton(
          color: Colors.redAccent,
          child: Text("Validate"),
          textColor: Colors.blue,
          onPressed: (){

          },
        )
      ]
      ),

    );

  }

}