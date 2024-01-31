import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Container(
            height:85,
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
                'https://placekitten.com/100/100', // Example placeholder image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text('mia_bondu',style: TextStyle(fontSize: 11),)
        ]
    );
  }
}