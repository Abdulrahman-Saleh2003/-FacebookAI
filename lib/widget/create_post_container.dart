import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookai/models/models.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({super.key, required this.currentUser});
final User currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.orange,
      child:  Column(children: [
        Row(children: [
CircleAvatar(radius: 20,
backgroundColor: Colors.grey[200]
  ,backgroundImage:
  CachedNetworkImageProvider(currentUser.imageUrl)
  ,)

        ],)
      ],) ,

    );
  }
}
