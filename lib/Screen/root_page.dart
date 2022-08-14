import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_ui/Screen/cart_page.dart';
import 'package:plant_ui/Screen/favorite_page.dart';
import 'package:plant_ui/Screen/home_page.dart';
import 'package:plant_ui/Screen/profile_page.dart';
import 'package:plant_ui/Screen/scan_page.dart';
import 'package:plant_ui/constant.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}
//list Of pages
List<Widget> pagesList = const [
  HomeScreen(),
  FavoriteScreen(),
  CartScreen(),
  ProfileScreen()
];

//list of icons
List <IconData> iconsList = [
  Icons.home,
  Icons.favorite,
  Icons.shopping_cart_sharp,
  Icons.manage_accounts,
];
//list of titles
List <String> titlesList = [
  'Home Screen',
  'Favorite Screen',
  'Cart Screen',
  'Profile Screen',
];
//to mange the page index
int _currentIndexNav = 0;
class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(titlesList[_currentIndexNav],style: TextStyle(color: Constants.blackColor),),
          Icon(Icons.notifications,color: Constants.blackColor,)
        ],)
      ),
      body: IndexedStack(
        index: _currentIndexNav,
        children: pagesList,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconsList,
    splashColor: Constants.primaryColor,

        inactiveColor: Constants.blackColor,
        activeColor: Constants.primaryColor,
        activeIndex: _currentIndexNav,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _currentIndexNav = index),
        //other params
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context, PageTransition(child: const ScanScreen(), type: PageTransitionType.leftToRight));
        },
        backgroundColor: Constants.primaryColor,
        child:  Image.asset('assets/images/code_scan.png',width: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );


  }
}
