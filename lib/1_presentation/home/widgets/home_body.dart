import 'package:clean_rlg/1_presentation/home/widgets/quest/quest.dart';
import 'package:clean_rlg/1_presentation/home/widgets/quest/quest_add_button.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return ListView(
      children: [
        SizedBox(
          height: height * 0.033,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Progress",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: height * 0.0225),
              ),
              QuestAddButton(
                onTap: () {},
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.033,
        ),
        Container(
          height: height * 0.05,
          color: Colors.grey,
        ),
        SizedBox(
          height: height * 0.016,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.06),
          child: Row(
            children: [
              Text("Quests",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: height * 0.0225)),
                      const Spacer(),
              Text("Pt: 20", style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: height * 0.0225))
            ],
          ),
        ),
        SizedBox(
          height: height * 0.016,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.05),
          child: const Row(
            children: [Quest(), Spacer(),Quest()],
          ),
        ),
      ],
    );
  }
}
