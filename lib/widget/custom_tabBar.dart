
import 'package:facebook/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.icons, required this.selectedIndex,required this.onTap,});
  final  List<IconData>  icons;
  final int selectedIndex;
  // final VoidCallback? onTab;
  final Function(int) onTap;


  @override
  Widget build(BuildContext context) {
    return TabBar(

        onTap:onTap ,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(border: Border(top: BorderSide(color: Palette.facebookBlue,width: 3))),
        tabs:icons.asMap().map((i,e)=>MapEntry(i,Tab(icon:Icon(e,


          color:i==selectedIndex? Palette.facebookBlue:Colors.black45,size: 30
          ,) ,)
        )).values
            .toList()
    );
  }
}
