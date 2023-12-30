
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_based_app/Screens/Cart_Page.dart';
import 'package:plant_based_app/Screens/Scan_Page.dart';
import 'package:plant_based_app/Screens/profile_page.dart';
import 'package:plant_based_app/constants/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'Home_page.dart';
import 'favorite_page.dart';


class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

 int _bottomNavIndex=0;


  // List of the pages
  List<Widget> pages= const[
    Home_Page(),
    favorite_Page(favoritedPlants: [],),
    CartPage(addedToCartPlants: [],),
    ProfilePage(),
  ];

 // List of the pages icons
  List<IconData> iconsList = const[
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];

  List<String> titleList = const[
    'Home',
    'favorite',
    'Cart',
    'Profile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children:pages
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         Navigator.push(context,PageTransition(child:const ScanPage(), type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset('assets/images/code-scan-two.png',height: 30.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconsList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex =index;
          });
        },
      ),
      
    );
  }
}
