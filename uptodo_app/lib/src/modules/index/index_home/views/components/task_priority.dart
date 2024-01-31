import 'package:flutter/material.dart';
import 'package:uptodo_app/src/globals/utilities/constants.dart';

class TaskPriorityDialog extends StatefulWidget {
  const TaskPriorityDialog({Key? key, required this.onTap}) : super(key: key);
  final Function(int value) onTap;
  @override
  State<TaskPriorityDialog> createState() => _TaskPriorityDialogState();
}

class _TaskPriorityDialogState extends State<TaskPriorityDialog> {
  int? _selectedPriority;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Task Priority',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final priority = index + 1;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedPriority = priority;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedPriority == priority
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.flag),
                        const SizedBox(height: 8.0),
                        Text(
                          '$priority',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel button pressed
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedPriority != null) {
                      logger.d('Selected Priority: $_selectedPriority');
                      widget.onTap(_selectedPriority!);
                      Navigator.pop(context); // Close the dialog after saving
                    } else {
                      logger.d('No Priority Selected');
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
