import 'package:flutter/material.dart';

class Quest extends StatelessWidget {
  const Quest({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: width * 0.42, maxHeight: height * 0.187),
          child: Container(
            decoration: BoxDecoration(
                color: //themdata.colorScheme.secondary,
                    const Color.fromARGB(255, 9, 95, 175),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        shape: const CircleBorder(),
                        activeColor: Colors.white,
                        checkColor: const Color.fromARGB(255, 9, 95, 175),
                        value: //quest.done,
                            true,
                        onChanged: (value) {
                          //   BlocProvider.of<QuestControllerBloc>(context).add(
                          //       UpdateQuestEvent(quest: quest, done: value!));
                          //   BlocProvider.of<PointsManagerBloc>(context).
                          //   add(PointsUpdatingEvent(menge: 10));
                        },
                      ),
                    ),
                    SizedBox(
                      width: width * 0.17,
                    ),
                    Text("12:40",
                        style: TextStyle(
                            fontSize: height * 0.017, color: Colors.white))
                  ],
                ),
                Center(
                  child: Text("Title",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.017,
                          color: Colors.white)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  child: Text(
                      "This will be the body sjkfh s ishfksdkjk sdf sf d  dsfsdf",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: height * 0.017, color: Colors.white)),
                ),
                const Spacer(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     SizedBox(
                //       height: 25,
                //       width: 25,
                //       child: Transform.scale(
                //         scale: 1.3,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}
