import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/profile_avata.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(
        12,
        8,
        12,
        0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: currentUser.imageUrl,
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What on your minds?",
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text("Live"),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text("Photo"),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text("Live"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
