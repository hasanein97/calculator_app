import 'package:calculator_app/constants/constants.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
   CustomButton({Key? key,
   required this.btnColor,
   required this.btnTxt,
   required this.flex,
    this.callBack,

  }) : super(key: key);
  Color ? btnColor ;
  String ? btnTxt;
  int ? flex;
  Function? callBack;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex== null?1: flex!,
        child: GestureDetector(
          onTap: (){
            callBack!(btnTxt);
          },
          child: Container(
            width: 70,
            height: 80,
            child: Text(
              btnTxt!,
              style: Constants.btnTextStyle,
            ),
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: btnColor,

            ),
          ),
        ),
      );
  }
}
