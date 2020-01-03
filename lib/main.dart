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

  //vl-Step-03: Initialize a GlobalKey type variable
  var _formKey = GlobalKey<FormState>();

  //av-(1)For autovalidation
  var _autoValidate = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Form Validation Practice"),),

      //vl-step01: At Scaffold body place Form widget
      body: Form(

        //vl-Step04: put Globalkey type var in Form key
        key: _formKey,

        //av-(2)For auto checking input valid or not use autoValidate
        autovalidate: _autoValidate,

        child: Column( children: <Widget>[
          TextFormField(

            //(N-1)For name validation put TextInputType.text
            keyboardType: TextInputType.text,

            //(N-2) Put logic to show error message
            validator:(String inputName){
              if(inputName.length<3){
                return "Name must contain more than 3 characters";
              }
              else
                return null;
            },

            decoration: InputDecoration(
                labelText: "Name",
                hintText: "e.g.Niloy"
            ),
          ),

          //vl-step02: use TextFormField instead of TextField
          TextFormField(

            //(P-1)For phone number validation put TextInputType.phone
            keyboardType: TextInputType.phone,

            //vl-step05:put a function to get your expected validation
            //(P-2) Put logic to show error message
            validator: (String inputNum){
              if(double.tryParse(inputNum)==null){
                return "Input Valid Number";
              }
              else if(inputNum.length!=11){
                return "Phone number must contain 11 digits";
              }
              else
               return null;
            },

            decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "e.g.01717366350"
            ),
          ),
          TextFormField(
            //(E-1)For email validation put TextInputType.emailAddress
            keyboardType: TextInputType.emailAddress,

            //(E-2)Put logic to show error
            validator: (String inputEmail){

              //(Process- 01):
              Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
              bool emailValid = RegExp(pattern).hasMatch(inputEmail);
              if(!emailValid){
                return "input valid email";
              }
              else return null;


              //(Process- 02)://Todo


            },

            decoration: InputDecoration(
                labelText: "Email address",
                hintText: "e.g.tom123@gmail.com"
            ),
          ),
          RaisedButton(
            color: Colors.redAccent,
            child: Text("Validate"),
            textColor: Colors.blue,

            //vl-step06: put logic to execution in validation
            onPressed: (){
              setState(() {
                if(_formKey.currentState.validate()){
                  //ToDo
                }

                //av-(3) for invalidation put autovalidate true
                else{
                  _autoValidate =true;
                }
              });
            },

          )
        ]
        ),
      )
      ,

    );

  }

}