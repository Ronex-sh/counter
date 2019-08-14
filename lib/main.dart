
























import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MaterialApp(
  home: MyHomePage(),

));


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = new GlobalKey<FormState>();
  int Add=0;
  String text='';
  String text2="Select your country and contribute to raising shares and stock exchange in your country";
  String m='';
  String _myActivity;
  String _myActivityResult;

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: Text('Counter'),centerTitle: true,),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropDownFormField(

                titleText: 'country',
                hintText: 'Please choose one',
                value: _myActivity,
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "iraq",
                    "value": "iraq",
                  },
                  {
                    "display": "Saudi",
                    "value": "Saudi",
                  },
                  {
                    "display": "Egypt",
                    "value": "Egypt",
                  },
                  {
                    "display": "Syria",
                    "value": "Syria",
                  },
                  {
                    "display": "Lebanon",
                    "value": "Lebanon",
                  },
                  {
                    "display": "Algeria",
                    "value": "Algeria",
                  },

                ],
                textField: 'display',
                valueField: 'value',


              ),
              Container(

                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  color: Colors.black,
                  child: Text('Save',style: TextStyle(color: Colors.redAccent,fontSize: 20),),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(_myActivityResult),
              ),




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Text('$text2',style: TextStyle(fontWeight:FontWeight.bold),)),
              ),
              IconButton(icon: Icon(Icons.arrow_upward,color: Colors.purpleAccent), onPressed: (){
                setState(() {

                  Add++;
                  text='Thanks. you contributed to raise $Add points';
                });


              }),
              Text('$Add',style: TextStyle(fontSize: 30),),
              IconButton(icon: Icon(Icons.arrow_downward,color: Colors.purpleAccent,), onPressed: (){
                setState(() {
                  if(Add>=2){

                    Add--;

                    text=' You delete $Add points';
                  }

                });

              }),

              Card(
                color: Colors.black,
                child: IconButton(icon: Icon(FontAwesomeIcons.flag,size: 30,color: Colors.amber,), onPressed:(){

                  setState(() {
                    if(text=='Thanks. you contributed to raise $Add points'){
                      m='Thanks. you contributed to raise $Add points';
                    }else{
                      m=' You delete $Add points';


                    }
                  });
                } ),
              ),



              Card(shape: UnderlineInputBorder(borderSide: BorderSide(width: 1,)),child: Text('$m',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

            ],
          ),
        ),


      ),



    );
  }


}




