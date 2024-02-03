import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onTap;
  final Icon icon;
  const CustomIconButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return InkResponse(
        onTap: () {},
        child: CircleAvatar(
          radius: height*0.018,
          backgroundColor: Colors.grey[300],
          child: icon,
        ));
  }
}
