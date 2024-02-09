import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [

            // Image
            Container(
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/abdullahCui.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Note Container
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(8.5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Text('Note...', style: TextStyle(color: Colors.grey.shade500,
                fontSize: 13)),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 15,
              child: Center(child: Text('Your note',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
              )),
            ),
          ],
        ),

      ],
    );
  }
}
