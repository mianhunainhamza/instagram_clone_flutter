import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle
          ),
          child: ClipOval(child: Image.asset('assets/images/areeb.jpg',fit: BoxFit.cover,))),
      title: Text('username'),
      subtitle: Text('sent 4h ago'),
      trailing: Image.asset('assets/icons/camera.png',height: 30),
    );
  }
}
