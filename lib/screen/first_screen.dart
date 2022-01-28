
import 'package:calculator_app/constants/constants.dart';
import 'package:calculator_app/widget/custom_button.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String exp = '';
  String history = '';
  double num1=0;
  double num2=0;
  String op='';
  void numClick(String btnTxt){
   if (btnTxt== 'Ac'){
      setState(() {
        exp = '';
        history = '';
      });
     num1=0;
     num2=0;
   }else if (btnTxt=='C'){
     setState(() {
       exp='';
     });
   }
   else if(btnTxt=='+'||btnTxt=='-'||btnTxt=='/'||btnTxt=='x'||btnTxt=='%'){
     op=btnTxt;
     num1=double.parse(exp);
    setState(() {
      exp='';
      history=num1.toString();
      history+=btnTxt;
    });
    }
   else if (btnTxt=='.'){
     if (exp.contains('.')){}
       else {
       setState(() {
         exp+=btnTxt;
       });
     }
     }
   else if (btnTxt=='='){
     num2= double.parse(exp);
     history+=exp;
     switch(op){
       case'+':{
         exp=(num1+num2).toString();
       }
       break;
       case'x':{
         exp=(num1*num2).toString();
       }
       break;
       case'-':{
         exp=(num1-num2).toString();
       }
       break;
       case'%':{
         exp=(num1%num2).toString();
       }
       break;
       case'/':{
        num2 ==0?exp='unvalid operation': exp=(num1/num2).toString();
       }
       break;
       default :break;

     }
     setState(() {

     });
   }
   else {
    setState(() {
      exp+=btnTxt;
    });
   }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: const Text("calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
            Container(
              margin: Constants.textMargin,
              alignment:Constants.textAlignment,
              child: Text(history,
           style: Constants.style1
           ),
            ),
          const Divider(
            color: Colors.grey,
            thickness: 5,
          ),
          Container(
            margin:Constants.textMargin,

            alignment:Constants.textAlignment,
            child: Text(exp,
              style: Constants.style1,

            ),
          ),
          Row(
            children: [
              CustomButton(btnColor: Colors.blue, btnTxt: "Ac", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.yellow, btnTxt: "C", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.teal, btnTxt: "%",flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.red, btnTxt: "/", flex: 1,callBack: numClick,),
            ],
          ),
          Row(
            children: [
              CustomButton(btnColor: Colors.blue, btnTxt: "7", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.yellow, btnTxt: "8", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.teal, btnTxt: "9",flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.red, btnTxt: "x", flex: 1,callBack: numClick,),
            ],
          ),
          Row(
            children: [
              CustomButton(btnColor: Colors.blue, btnTxt: "4", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.yellow, btnTxt: "5", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.teal, btnTxt: "6",flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.red, btnTxt: "-", flex: 1,callBack: numClick,),
            ],
          ),
          Row(
            children: [
              CustomButton(btnColor: Colors.blue, btnTxt: "1", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.yellow, btnTxt: "2", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.teal, btnTxt: "3",flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.red, btnTxt: "+", flex: 1,callBack: numClick,),
            ],
          ),
          Row(
            children: [
              CustomButton(btnColor: Colors.blue, btnTxt: "0", flex: 2,callBack: numClick,),
              CustomButton(btnColor: Colors.yellow, btnTxt: ".", flex: 1,callBack: numClick,),
              CustomButton(btnColor: Colors.teal, btnTxt: "=",flex: 1,callBack: numClick,),

            ],
          ),

        ],
      ),
    );
  }
}
