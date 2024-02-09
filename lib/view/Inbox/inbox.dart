import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:insta_clone/view/Inbox/Widgets/chats.dart';
import 'package:insta_clone/view/Inbox/Widgets/note.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  final bool darkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkMode? Colors.black : Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.keyboard_backspace_outlined,size: 30,)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 22),
              child: Image.asset('assets/icons/camera2.png',height: 22)),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset('assets/icons/edit.png',height: 32,),
          )
        ],
        backgroundColor:darkMode? Colors.black : Colors.white,
        title: Row(
          children: [
            Text('Username',
              style: TextStyle(
                  color: darkMode? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold
              )),
            SizedBox(width: 9),
            Icon(CupertinoIcons.chevron_down,size: 15,)
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
               height: 37,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined,color: Colors.grey.shade500),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    fillColor: Colors.grey.shade900,
                    filled: true,
                    contentPadding: EdgeInsets.all(0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),

            // Adding Note
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Container(
                height: 140,
                width: Get.width,
                child: ListView.separated(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return Notes();
                    }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20),
                ),
              ),
            ),

            // Message and Request
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Messages',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16),),
                  Text('Requests',
                    style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),)
                ],
              ),
            ),

            // Chats
            Container(
              height: Get.height/1.66,
              width: Get.width,
              child: ListView.separated(
                itemCount: 13,
                  itemBuilder: (context,index){
                    return Chats();
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 3),),
            )
          ],
        ),
      )
    );
  }
}
