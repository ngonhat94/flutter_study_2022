import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hoc_flutter/chapter2/circle_image.dart';
import 'package:hoc_flutter/chapter2/models/post.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CirleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        const SizedBox(width: 16),
        Expanded(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text('${post.timestamp} mins ago', style: const TextStyle(fontWeight: FontWeight.w700),),
            ],
          ),
        )
      ],
    );
  }
}