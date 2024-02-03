import 'package:clean_rlg/0_core/custom_widgets/custom_add_button.dart';
import 'package:clean_rlg/1_presentation/home/widgets/tomorrow_quest/tomorow_quest.dart';
import 'package:flutter/material.dart';

class TomorrowQuestGround extends StatelessWidget {
  const TomorrowQuestGround({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
          bottom: height * 0.05,
          top: height * 0.02),
      child: Material(
          elevation: 16,
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: ListView(children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        size: height * 0.03789,
                      ))),
              const TomorrowQuest(),
              const TomorrowQuest(),
              const TomorrowQuest(),
              const TomorrowQuest(),
              const AddButton()
            ]),
          )),
    );
  }
}
