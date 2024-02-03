import 'package:flutter/material.dart';

class QuestAddButton extends StatelessWidget {
  final Function onTap;
  const QuestAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return InkResponse(
      onTap: (){onTap();},
      child: Container(
        height: height * 0.033,
        width: width * 0.23,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 95, 175),
            borderRadius: BorderRadius.circular(3)),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.02),
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),const Spacer(),
              Text("Quest", style: TextStyle(color: Colors.white, fontSize: height*0.02))
            ],
          ),
        ),
      ),
    );
  }
}
