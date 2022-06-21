import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 2),
                  blurRadius: 10.0,
                )
              ],
              image:
                  DecorationImage(image: AssetImage('./assets/user_icon.png')),
            ),
          ),
        ),
      ),
    );
  }
}
