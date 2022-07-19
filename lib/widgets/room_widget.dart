import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/widget.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 4,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _createRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }

  Widget _createRoomButton() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Colors.blueAccent[100]!,
          width: 3,
        ),
        primary: Palette.facebookBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rec) => Palette.createRoomGradient.createShader(
              rec,
            ),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "Create\nRoom",
          )
        ],
      ),
    );
  }
}
