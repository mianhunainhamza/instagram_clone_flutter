import 'package:flutter/material.dart';

class PersonalStory extends StatelessWidget {
  const PersonalStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red, // You can change the border color
              width: 2,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              // Your image source here
              'https://placekitten.com/100/100',
              // Example placeholder image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          top: 55,
          child: Container(
            height: 40, // Adjust the height as needed
            width: 26, // Adjust the width as needed
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.add,color: Colors.white,)
            ),
          ),
        ),
      ]),
      SizedBox(
        height: 5,
      ),
      Text(
        'Your story',
        style: TextStyle(fontSize: 11),
      )
    ]);
  }
}
