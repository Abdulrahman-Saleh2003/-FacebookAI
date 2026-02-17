import 'package:facebook/config/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widget/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key, required this.onlineUsers});

  final List<User> onlineUsers;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index==0){

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CreateRoomButton(),
            ); // Padding
          }

          final User user=onlineUsers[index-1];

          return Padding(

              padding: EdgeInsetsGeometry.symmetric(horizontal: 8,


          ),

              child: ProfileAvatar(imageUrl: user.imageUrl,isActive:true,));
        },
      ), // ListView.builder
    ); // Container
  }}
class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),

      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Colors.white,
        side: BorderSide(
          width: 3.0,
          color: Colors.blueAccent[100]!,
        ),
        // هذا بديل لـ textColor في الزر القديم
        foregroundColor: Palette.facebookBlue,
      ),

      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white, // يجب أن تكون بيضاء ليعمل الـ Shader عليها
            ),
          ),
          const SizedBox(width: 4.0),
          Text('Create\nRoom'), // النص بجانب الأيقونة
        ],
      ),
    );
  }
}