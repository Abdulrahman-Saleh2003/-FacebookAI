import 'package:facebook/data/data.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widget/stories.dart';
import 'package:facebook/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:facebook/config/palette.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.white,
            title: Text(
              'Facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(icon:Icons.search ,iconSize:30 ,onPressed: () {

              },), CircleButton(icon:MdiIcons.facebookMessenger ,iconSize:30 ,onPressed: () {

              },),
            ],


          ),
          // SliverPadding
      SliverToBoxAdapter(
        child:
             CreatePostContainer(currentUser: currentUser)
      ),
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 10, 0, 5),
        sliver:  SliverToBoxAdapter(
          child:
               Rooms(onlineUsers: onlineUsers)
        ),
      ), SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 5, 0, 5),
        sliver:  SliverToBoxAdapter(
          child:
               Stories(currentUser: currentUser ,stories: stories,)
        ),
      ),
          
          SliverList(delegate:
          SliverChildBuilderDelegate(
            childCount:posts.length ,

                (context, index)


            {

              final   Post post=posts[index];


return PostContainer(post :post);
            },

          ))

        ],



      ),


    );
  }
}