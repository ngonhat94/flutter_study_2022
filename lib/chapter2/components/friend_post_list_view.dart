import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hoc_flutter/chapter2/components/friend_post_tile.dart';
import 'package:hoc_flutter/chapter2/models/post.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;
  const FriendPostListView({Key? key, required this.friendPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chefs 👩‍🍳', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            }, 
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16,);
            }, 
            itemCount: friendPosts.length
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}