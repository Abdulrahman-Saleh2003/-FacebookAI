import 'package:facebook/config/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widget/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key, required this.currentUser, required this.stories});
final List<Story> stories;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCard(
                isAddStory: true,
                  currentUser:currentUser
              ),
            );
          }
final  Story story=stories[index-1];
          return Padding(

              child:StoryCard(story:story),
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4


          ));

        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({super.key,  this.currentUser,  this.isAddStory=false,  this.story});
  final User? currentUser;
  final bool isAddStory;
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect( // إضافة لقص الحواف
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ), // BoxDecoration
        ),


        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ), // BoxDecoration
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Palette.facebookBlue,
              onPressed: () => print('Add to Story'),
            ), // IconButton
          ) // Container
              : ProfileAvatar(imageUrl: story!.user.imageUrl,hasBorder:!story!.isViewed),



        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), // TextStyle
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ), // Text
        ), // Positioned
      ],
    );
  }
}
