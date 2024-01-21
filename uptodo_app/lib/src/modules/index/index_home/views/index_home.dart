import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';
import 'package:uptodo_app/src/config/themes/app_styles.dart';

class IndexHome extends StatefulWidget {
  const IndexHome({Key? key}) : super(key: key);

  @override
  _IndexHomeState createState() => _IndexHomeState();
}

class _IndexHomeState extends State<IndexHome> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            // Page 0 - Your main content
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                        Text(
                          'Index',
                          style: AppStyles.bodyStyle.copyWith(fontSize: 20),
                        ),
                        const CircleAvatar(
                          radius: 40,
                          foregroundImage:
                              AssetImage(AssetsPaths.profileAvatar),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image.asset(AssetsPaths.taskChecklist),
                    ),
                    Text(
                      'What do you want to do today?\n',
                      style: AppStyles.bodyStyle.copyWith(fontSize: 20),
                    ),
                    Text(
                      'Tap + to add your tasks',
                      style: AppStyles.bodyStyle,
                    ),
                  ],
                ),
              ),
            ),

            const Center(
              child: Text('Calendar Page Content'),
            ),

            const Center(
              child: Text('Focus Page Content'),
            ),

            const Center(
              child: Text('Profile Page Content'),
            ),
            const Center(
              child: Text('Add task Page Content'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _pageController.jumpToPage(4);
          },

          backgroundColor: AppColors.systemPurple,
          child: const Icon(
            Icons.add,
            color: AppColors.primaryWhite,
          ), // Customize the color if needed
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: SizedBox(
            height: 80.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.home_filled,
                          semanticLabel: 'Home',
                        ),
                        onPressed: () {
                          _pageController.jumpToPage(0);
                        },
                        color: _currentIndex == 0
                            ? AppColors.primaryWhite
                            : Colors.grey),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        semanticLabel: 'Calendar',
                      ),
                      onPressed: () {
                        _pageController.jumpToPage(1);
                      },
                      color: _currentIndex == 1
                          ? AppColors.primaryWhite
                          : Colors.grey,
                    ),
                    const SizedBox(width: 40.0),
                    IconButton(
                      icon: const Icon(
                        Icons.access_time_outlined,
                        semanticLabel: 'Focus',
                      ),
                      onPressed: () {
                        _pageController.jumpToPage(2);
                      },
                      color: _currentIndex == 2
                          ? AppColors.primaryWhite
                          : Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        semanticLabel: 'Profile',
                      ),
                      onPressed: () {
                        _pageController.jumpToPage(3);
                      },
                      color: _currentIndex == 3
                          ? AppColors.primaryWhite
                          : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
