import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              Text(todo.title),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(DateFormat('yyyy-MM-dd').format(todo.dateTime))),
              const Spacer(),
              Text(todo.category.categoryName),
              const Spacer(),
              Text(todo.priority.toString()),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
