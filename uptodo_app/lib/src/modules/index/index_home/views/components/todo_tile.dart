import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';
import 'package:uptodo_app/src/globals/utilities/utilities.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.editTodoPage, arguments: todo);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF363636),
          borderRadius: BorderRadius.circular(6),
        ),
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10.0),
                    child: todo.isDone
                        ? const Icon(Icons.circle)
                        : const Icon(Icons.circle_outlined)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(todo.title),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child:
                        Text(DateFormat('yyyy-MM-dd').format(todo.dateTime))),
                const Spacer(),
                Container(
                  height: 30,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Utils.getColorFromString(todo.category.color),
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Row(
                    children: [
                      Icon(
                        Utils.getIconFromString(todo.category.iconName),
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(todo.category.categoryName),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: AppColors.primaryPurple,
                      )),
                  child: Row(
                    children: [
                      const Icon(Icons.flag_outlined),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(todo.priority.toString()),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
