import 'package:flutter/material.dart';

class CustomSignButton extends StatelessWidget {

  final String buttonText;
  final Function onTap;
  const CustomSignButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return InkResponse(
      onTap: ()=> onTap(),
      child: Container(
        height: height * 0.05,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(18)),
        child: Center(child:  Text(buttonText, style: TextStyle(color: Colors.white, fontSize: height*0.025),),)
      ),
    );
  }
}
