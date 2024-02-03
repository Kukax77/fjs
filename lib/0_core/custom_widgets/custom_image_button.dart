import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  final Function onTap;
  final String imagepath;
  const CustomImageButton(
      {super.key, required this.onTap, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return InkResponse(
      onTap: (){onTap;},
      child: SizedBox(
          height: height * 0.05,
          width: height * 0.05,
          child: Image.asset(
            imagepath,
            fit: BoxFit.fill,
          )),
    );
  }
}
