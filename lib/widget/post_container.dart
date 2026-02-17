import 'package:facebook/config/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widget/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key, required this.post});
final Post post;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsetsGeometry.symmetric(vertical: 8)
      ,
      margin: EdgeInsetsGeometry.symmetric(vertical: 5),


      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                PostHeader(post:post),
                SizedBox(height: 8,),
                Text(post.caption),
                post.imageUrl != null?
                    SizedBox.shrink():SizedBox(height: 6,)


              ],),
          ),

          post.imageUrl != null ?Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 2),
            child: Image.asset(post.imageUrl!),
          ):
          SizedBox.shrink(),
          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 12),


          child: PostStats(post:post),)


        ]
      ),
    );
  }
}




class PostStats extends StatelessWidget {
  const PostStats({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return
      Column(children:
      [Row(children: [


        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(color: Palette.facebookBlue,shape: BoxShape.circle),

          child: Icon(Icons.thumb_up,size: 10,color: Colors.white,),),
        SizedBox(width: 4,),
        Expanded(child: Text("${post.likes}",style: TextStyle(color: Colors.grey[600]),)),
        Text("${post.comments} Comments",style: TextStyle(color: Colors.grey[600]),),
        SizedBox(width: 8,),

        Text("${post.shares} Shares",style: TextStyle(color: Colors.grey[600]),)
      ],
      ),

        Divider(),

        Row(children: [

         PostButton(icon:Icon(MdiIcons.thumbUpOutline,color: Colors.grey[700],size: 20,),label:"Like",onTap: () {

         },),  PostButton(icon:Icon(MdiIcons.commentOutline,color: Colors.grey[700],size: 20,),label:"Comment",onTap: () {

         },),  PostButton(icon:Icon(MdiIcons.shareOutline,color: Colors.grey[700],size: 25,),label:"Share",onTap: () {

         },),
        ],)
      ]
        ,
      );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({super.key, required this.icon, this.onTap, required this.label});
final Icon icon;
  final VoidCallback? onTap;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(

          onTap: onTap,
          child: Container(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 12),

            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              icon,
              SizedBox(width: 4,),
              Text(label),


            ],),
          ),

        ),
      ),
    );
  }
}












class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 8,),
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Text(post.user.name,style: TextStyle(fontWeight: FontWeight.w600)),
            Row(children: [
              Text("${post.timeAgo} .",style: TextStyle(color:Colors.grey[600],fontSize: 12 ),),
              Icon(Icons.public,color: Colors.grey[600],size: 12,),



            ],)



          ],),
        )
,

        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
      ],

    );
  }
}


