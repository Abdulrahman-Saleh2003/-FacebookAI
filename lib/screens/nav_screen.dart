import 'package:facebook/screens/home_screen.dart';
import 'package:facebook/widget/widget.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}


final List<Widget> screens = [
  HomeScreen(),
  const Center(child: Text('Watch / Videos Screen', style: TextStyle(fontSize: 30))),
  const Center(child: Text('Marketplace Screen', style: TextStyle(fontSize: 30))),
  const Center(child: Text('Groups Screen', style: TextStyle(fontSize: 30))),
  const Center(child: Text('Notifications Screen', style: TextStyle(fontSize: 30))),
  const Center(child: Text('Menu / Profile Screen', style: TextStyle(fontSize: 30))),
];

final List<IconData> icons = const [
  Icons.home,
  Icons.ondemand_video,
  Icons.storefront_outlined,
  Icons.group_outlined,
  Icons.notifications_outlined,
  Icons.menu,
];

 int selectedIndex=0;
class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: screens.length, child: Scaffold(


      body: IndexedStack(index: selectedIndex,children: screens,),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: CustomTabBar(icons: icons,selectedIndex:selectedIndex ,
          onTap:(index) =>setState(() {
          selectedIndex=index;
        })  ,),
      ),

    ));
  }
}

