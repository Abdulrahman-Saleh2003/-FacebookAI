import 'package:cached_network_image/cached_network_image.dart'; // ستحتاج لاستيراد هذه المكتبة
import 'package:facebook/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({super.key, required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,

  });



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
              radius: hasBorder ? 17 :20,

              backgroundColor: Colors.grey[200]

              ,backgroundImage:AssetImage(imageUrl)

          // backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),

        isActive ?
        Positioned(bottom: 0,
            right: 0,

            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.white),
                shape: BoxShape.circle
              , color : isActive?Palette.online:Colors.grey ,),
             ) ):
            SizedBox.shrink()

      ],
    );
  }
}