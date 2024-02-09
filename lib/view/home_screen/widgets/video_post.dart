import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoPost extends StatelessWidget {
  const VideoPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Stack(
        children: [
          Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/abdullahCui.jpg',
              fit: BoxFit.cover,
              )
          ),
          Positioned(
            left: 6,
            top: 5,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    child: ClipOval(
                      child: Image.network(
                        // Your image source here
                        'https://placekitten.com/100/100',
                        // Example placeholder image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'areebRashid',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      'Sponsored',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ])
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 180,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10, top: 5),
                  child: Icon(
                    Icons.more_horiz,
                    size: 29,
                  ))
            ]),
          ),
        ],
      ),
        SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SizedBox(
                width: 14,
              ),
              Icon(
                CupertinoIcons.heart,
                size: 27,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(CupertinoIcons.chat_bubble, size: 25),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.send_outlined,
                size: 24,
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                CupertinoIcons.share_up,
                size: 25,
              ))
        ]),
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '43,002 likes',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'areebRashid what a looks of the cat but hopefully it recovers soon. Please pray for it',
                style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
              ),
              Text(
                'more',
                style: TextStyle(
                    fontSize: 11, color: Colors.white.withOpacity(.4)),
              ),
              Text(
                'View all 200 comments',
                style: TextStyle(
                    fontSize: 11, color: Colors.white.withOpacity(.4)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: ClipOval(
                      child: Image.network(
                        // Your image source here
                        'https://placekitten.com/100/100',
                        // Example placeholder image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width - 60,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                            fontSize: 11, color: Colors.white.withOpacity(0.4)),
                        border: InputBorder.none,
                        // Remove the border
                        focusedBorder: InputBorder.none,
                        // Remove the border when focused
                        enabledBorder: InputBorder
                            .none, // Remove the border when not focused
                      ),
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(height: 2,),
              Text(
                '7 hours ago',
                style: TextStyle(
                    fontSize: 10, color: Colors.white.withOpacity(.4)),
              ),
            ],
          ),
        )]
    );
  }
}
