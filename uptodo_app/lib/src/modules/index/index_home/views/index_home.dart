import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';
import 'package:uptodo_app/src/config/themes/app_styles.dart';
import 'package:uptodo_app/src/modules/authentication/provider/auth_provider.dart';
import 'package:uptodo_app/src/modules/index/index_home/provider/todo_provider.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/show_calendar.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/todo_tile.dart';

import 'components/add_task.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<TodoProvider>().getAllTodos(
        (err) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error could not load tasks: $err")));
        },
        () {
          //onsucess
        },
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AuthenticationProvider>();
    final todoProvider = context.watch<TodoProvider>();
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            // Page 0 -
            Builder(builder: (context) {
              return Container(
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
                          radius: 30,
                          foregroundImage:
                              AssetImage(AssetsPaths.profileAvatar),
                        ),
                      ],
                    ),
                    if (todoProvider.isLoading) ...[
                      const SizedBox(
                        height: 55,
                        width: 55,
                        child: Center(child: LinearProgressIndicator()),
                      ),
                    ],
                    if (todoProvider.todos.isEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Image.asset(AssetsPaths.taskChecklist),
                      ),
                      Text(
                        'What do you want to do today?\n ${data.user?.email}',
                        style: AppStyles.bodyStyle.copyWith(fontSize: 20),
                      ),
                      Text(
                        'Tap + to add your tasks',
                        style: AppStyles.bodyStyle,
                      ),
                    ] else ...[
                      ListView.builder(
                          itemCount: todoProvider.todos.length,
                          shrinkWrap: true,
                          itemBuilder: (context, idx) {
                            final todo = todoProvider.todos[idx];
                            return TodoTile(todo: todo);
                          }),
                    ],
                  ],
                ),
              );
            }),

            Center(
              child: CalendarPicker(
                onTap: (vale) {},
              ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return TaskCreationSheet(
                      scrollController: scrollController,
                    );
                  },
                );
              });
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return const TaskCreationDialog();
          //   },
          // );
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
    );
  }
}
