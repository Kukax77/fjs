import 'package:clean_rlg/0_core/custom_widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class TomorrowQuest extends StatelessWidget {
  const TomorrowQuest({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.025),
      child: Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: height * 0.17, maxWidth: width * 0.7),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(children: [
              const SizedBox(),
              Padding(
                padding: EdgeInsets.all(width * 0.028),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Title"),
                        SizedBox(
                          width: width * 0.63,
                        ),
                        InkResponse(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.018),
                              child: const Text("10:48"),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.67,
                          child: const Text(
                            "This is the description of my tomorrow quessdfsdfsddsf sdnsdfnm,mnmadm,./smfasd,/mfnsda,/mfnasd,m.nasd,m/sm,/  /sl; ksdlkf naskfnasdkl;t bla bla bla lfj lsjf lj l;ksfkolasd fl;kjaskf lk; s;ladko fj;k",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Column(
                          children: [
                            InkResponse(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.018),
                                  child: const Text("10:48"),
                                ),
                              ),
                            ),
                            CustomIconButton(onTap: (){}, icon: const Icon(Icons.dark_mode, color: Colors.black,))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
