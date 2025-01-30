import 'package:cinemate/core/utils/color_palette.dart';
import 'package:cinemate/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late PersistentTabController _controller;
  final List<ScrollController> _scrollControllers = [
    ScrollController(),
    ScrollController(),
  ];
  DateTime? _lastPressed;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    savePage();
  }

  savePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', false);
  }

  @override
  void dispose() {
    for (final element in _scrollControllers) {
      element.dispose();
    }
    super.dispose();
  }

  List<Widget> _buildScreens() => [
    MainScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_filled),
      title: "Home",
      activeColorPrimary: ColorPalette.primaryColor,
      inactiveColorPrimary: ColorPalette.blackColor,
      scrollController: _scrollControllers.first,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Search",
      activeColorPrimary: ColorPalette.primaryColor,
      inactiveColorPrimary: ColorPalette.blackColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.calendar_month_outlined,
        color: ColorPalette.whiteColor,
      ),
      title: "Calendar",
      activeColorPrimary: ColorPalette.primaryColor,
      inactiveColorPrimary: ColorPalette.blackColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.favorite_outline_sharp),
      title: "Favorite",
      activeColorPrimary: ColorPalette.primaryColor,
      inactiveColorPrimary: ColorPalette.blackColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: "Profile",
      activeColorPrimary: ColorPalette.primaryColor,
      inactiveColorPrimary: ColorPalette.blackColor,
      scrollController: _scrollControllers.last,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      hideOnScrollSettings: HideOnScrollSettings(
        hideNavBarOnScroll: false,
        scrollControllers: _scrollControllers,
      ),
      padding: const EdgeInsets.only(top: 8),
      onWillPop: (final context) async {
        DateTime now = DateTime.now();
        if (_lastPressed == null ||
            now.difference(_lastPressed!) > const Duration(seconds: 2)) {
          _lastPressed = now;
          ScaffoldMessenger.of(context ?? this.context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }

        SystemNavigator.pop();
        return true;
      },
      backgroundColor: ColorPalette.whiteColor,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 250),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
        onNavBarHideAnimation: OnHideAnimationSettings(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style15,
      onItemSelected: (index) {

        if (index != 0) {
          _controller.index = 0;
        }
      },
    );
  }
}
