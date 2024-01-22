import 'package:flutter/material.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/show_calendar.dart';
import 'task_priority.dart';

class TaskCreationDialog extends StatefulWidget {
  const TaskCreationDialog({Key? key}) : super(key: key);

  @override
  _TaskCreationDialogState createState() => _TaskCreationDialogState();
}

class _TaskCreationDialogState extends State<TaskCreationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Task Description',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    // Open Calendar Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarPicker(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.access_time),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.label),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const TaskPriorityDialog();
                      },
                    );
                  },
                  icon: const Icon(Icons.flag),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
