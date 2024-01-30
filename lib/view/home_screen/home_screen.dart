import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone/view/home_screen/widgets/personal_story.dart';
import 'package:insta_clone/view/home_screen/widgets/story_widget.dart';
import 'package:insta_clone/view_model/home_controller.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Scaffold(
        backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
          actions: [
            Stack(
              children: [
                Icon(CupertinoIcons.heart,
                    size: 30,
                    color: context.isDarkMode ? Colors.white : Colors.black),
                if (homeController.messageCount.value > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 10, // Adjust the height as needed
                      width: 10, // Adjust the width as needed
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            Stack(
              children: [
                Icon(
                  LineIcons.facebookMessenger,
                  size: 35,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
                if (homeController.messageCount.value > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 20,
                      // Adjust the height as needed
                      width: 15,
                      // Adjust the width as needed
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          homeController.messageCount.value.toString(),
                          style: TextStyle(
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 10,
            )
          ],
          title: Row(children: [
            Container(
                height: 40,
                width: 130,
                child: Image.asset(
                  'assets/images/text.png',
                  color: context.isDarkMode ? Colors.white : Colors.black,
                )),
            const SizedBox(
              width: 7,
            ),
            Icon(
              CupertinoIcons.chevron_down,
              size: 13,
              color: context.isDarkMode ? Colors.white : Colors.black,
            )
          ]),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Your stories
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 125,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          // Check if it's the first item
                          if (index == 0) {
                            // Apply a different design for the first item
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PersonalStory(),
                            );
                          } else {
                            // Apply the design for other items
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Story(),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

            //all posts
            const Divider(
              thickness: .2,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
         showUnselectedLabels: false,
         backgroundColor: Colors.black,
         items : [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,size: 30,),label: 's'),
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.search,color: Colors.white,size: 30,),label: 's'),
           BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined,color: Colors.white,size: 30,),label: 's'),
           BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined,color: Colors.white,size: 30,),label: 's'),
           BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled,color: Colors.white,size: 30,),label: 's'),
          ],
        ),
      ),
    );
  }
}
