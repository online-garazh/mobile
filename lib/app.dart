import 'package:flutter/material.dart';
import 'package:mobile/components/custom_app_bar.dart';
import 'package:mobile/components/custom_icon_button.dart';
import 'package:mobile/features/home/pages/home_page.dart';
import 'package:mobile/features/profile/pages/profile_page.dart';
import 'package:mobile/navigation/navigation.dart';
import 'package:mobile/theme/custom_styles.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late PageController pageController;

  int _selectedIndex = 0;
  @override
  void initState() {
    pageController = PageController(
      initialPage: _selectedIndex,
    );

    super.initState();
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    pageController
      ..jumpToPage(index)
      ..animateToPage(index, duration: const Duration(seconds: 2), curve: Curves.easeIn);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MainNavigator.mainNavigatorKey,
      home: Scaffold(
        appBar: CustomAppBar(
          title: Text('$_selectedIndex page'),
          actions: [
            CustomIconButton(
              onPressed: () {
                MainNavigator.mainNavigatorKey.currentState?.push(
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              icon: Icons.person,
              color: AppPalette.black,
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: const [
                    HomePage(),
                    Scaffold(),
                    Scaffold(),
                    Scaffold(),
                    Scaffold(),
                  ],
                )),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: AppPalette.grey500,
          selectedItemColor: AppPalette.black,
          onTap: (i) {
            _onItemTapped(i);
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                ),
                icon: Icon(
                  Icons.home,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.webhook,
                ),
                icon: Icon(
                  Icons.webhook,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.message,
                ),
                icon: Icon(
                  Icons.message,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.add_alert,
                ),
                icon: Icon(
                  Icons.add_alert,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.menu,
                ),
                icon: Icon(
                  Icons.menu,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
