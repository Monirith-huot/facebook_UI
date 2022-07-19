import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/profile_avata.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post_model.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // print(post.imageUrl);
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _postHeader(post: post),
                const SizedBox(height: 4.0),
                Text(post.caption),
                post.imageUrl.isNotEmpty
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _postState(post: post),
          ),
        ],
      ),
    );
  }

  Widget _postHeader({required Post post}) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Text(
                  post.timeAgo + " • ",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            size: 16,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _postState({required Post post}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${post.comments} comments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${post.shares} shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _postButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: "Like",
              onTap: () => print(
                "Likes",
              ),
            ),
            _postButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: "comments",
              onTap: () => print(
                "Comments",
              ),
            ),
            _postButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25,
              ),
              label: "comments",
              onTap: () => print(
                "Comments",
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _postButton(
      {required Icon icon,
      required String label,
      required VoidCallback onTap}) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(
                  label,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
