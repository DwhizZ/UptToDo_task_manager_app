import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';
import 'package:uptodo_app/src/config/themes/app_styles.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo.dart';
import 'package:uptodo_app/src/modules/index/index_home/provider/todo_provider.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/todo_tile.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  DateTime _selectedIndex = DateTime.now();
  List<DateTime> dateList = [];
  String _selectedTodoState = "Uncompleted";

  @override
  void initState() {
    super.initState();
    getDateList();
  }

  getDateList() {
    var now = DateTime.now();
    _selectedIndex = now;
    dateList = [
      now.subtract(const Duration(days: 3)),
      now.subtract(const Duration(days: 2)),
      now.subtract(const Duration(days: 1)),
      now,
      now.add(const Duration(days: 1)),
      now.add(const Duration(days: 2)),
      now.add(const Duration(days: 3)),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  addADay(bool inFront) {
    if (inFront) {
      _selectedIndex = dateList[4];
      dateList.removeAt(0);
      dateList.add(dateList.last.add(const Duration(days: 1)));
    } else {
      _selectedIndex = dateList[2];
      dateList.removeLast();
      dateList = [
        dateList.first.subtract(const Duration(days: 1)),
        ...dateList
      ];
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    List<Todo> filterList() {
      final data = todoProvider.todos.where((element) {
        if (_selectedTodoState == "Uncompleted") {
          return !element.isDone &&
              element.dateTime.day == _selectedIndex.day &&
              element.dateTime.month == _selectedIndex.month &&
              element.dateTime.year == _selectedIndex.year;
        } else if (_selectedTodoState == "Completed") {
          return element.isDone &&
              element.dateTime.day == _selectedIndex.day &&
              element.dateTime.month == _selectedIndex.month &&
              element.dateTime.year == _selectedIndex.year;
        } else {
          return element.dateTime.day == _selectedIndex.day &&
              element.dateTime.month == _selectedIndex.month &&
              element.dateTime.year == _selectedIndex.year;
        }
      });

      return data.toList();
    }

    final results = filterList();

    return Column(
      children: [
        const Text(
          "Calender",
          style: TextStyle(fontSize: 28),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          width: double.infinity,
          height: 107,
          color: const Color(0xFf363636),
          child: Column(
            children: [
              //First row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      addADay(false);
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  Column(
                    children: [
                      Text(
                        // "FEBRUARY",
                        DateFormat('MMMM').format(_selectedIndex).toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        _selectedIndex.year.toString(),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      addADay(true);
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              //second row
              Row(
                children: [
                  for (var i in dateList) ...[
                    _buildCalenderDay(i),
                  ]
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),

        //Dropdown for Strings completed, uncompleted and both
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: DropdownButton<String>(
                value: _selectedTodoState,
                items: ["Completed", "Uncompleted", "Both"]
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTodoState = value!;
                  });
                }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        if (results.isEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(AssetsPaths.taskChecklist),
          ),
          Text(
            'What do you want to do today ?',
            style: AppStyles.bodyStyle.copyWith(fontSize: 20),
          ),
          Text(
            'Tap + to add your tasks',
            style: AppStyles.bodyStyle,
          ),
        ],

        ListView.builder(
            itemCount: results.length,
            shrinkWrap: true,
            itemBuilder: (context, idx) {
              final todo = results[idx];
              return TodoTile(todo: todo);
            }),

        //
      ],
    );
  }

  Widget _buildCalenderDay(DateTime day) {
    var dayNo = day.day;
    var dayName = switch (day.weekday) {
      1 => "MON",
      2 => "TUE",
      3 => "WED",
      4 => "THU",
      5 => "FRI",
      6 => "SAT",
      7 => "SUN",
      _ => "SUN",
    };

    print(dayNo);
    print(dayName);

    return Container(
      height: 48,
      width: 42,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color:
            _selectedIndex.microsecondsSinceEpoch == day.microsecondsSinceEpoch
                ? AppColors.primaryPurple
                : const Color(0xFF272727),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Text(
              dayName,
              style: TextStyle(
                  color: switch (dayName) {
                "SUN" => Colors.red,
                "SAT" => Colors.red,
                _ => Colors.white
              }),
            ),
            Text(dayNo.toString()),
          ],
        ),
      ),
    );
  }
}
