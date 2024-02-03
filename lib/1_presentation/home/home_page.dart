import 'package:auto_route/auto_route.dart';
import 'package:clean_rlg/1_presentation/home/widgets/home_body.dart';
import 'package:clean_rlg/1_presentation/home/widgets/tomorrow_quest/tomorrow_quest_ground.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quests", style: TextStyle(fontWeight: FontWeight.bold ),),
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu, color: Colors.black,)),
        backgroundColor: Colors.white,
      ),
      body: const Stack(
        children: [
           HomeBody(),
           TomorrowQuestGround(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              // if (index == 1) {
              //   AutoRouter.of(context).replace(const ActivityRoute());
              // }
            },
            
            selectedItemColor:Colors.grey[900],
            unselectedItemColor: Colors.grey[500],
            currentIndex: 0,
            backgroundColor: Colors.white,
            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  label: "Shop")
            ],
          ),
    );
  }
}
