import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';
import 'package:uptodo_app/src/globals/providers/validator.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo_category.dart';
import 'package:uptodo_app/src/modules/index/index_home/provider/todo_provider.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/choose_categories.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/show_calendar.dart';
import 'task_priority.dart';

class TaskCreationSheet extends StatefulWidget {
  const TaskCreationSheet({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;
  @override
  State<TaskCreationSheet> createState() => _TaskCreationSheetState();
}

class _TaskCreationSheetState extends State<TaskCreationSheet> with Validator {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TodoCategory? _selectedCategory;
  int? _selectedPriority;
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ktodoProvider = context.watch<TodoProvider>();
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15.0),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add Task',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: titleController,
                validator: nameValidator,
                decoration: const InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                validator: nameValidator,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      // Open Calendar Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarPicker(
                            onTap: (dateTime) {
                              setState(() {
                                _selectedDate = dateTime;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.access_time,
                      color: _selectedDate == null
                          ? Colors.grey
                          : AppColors.primaryPurple,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(child: ChooseCategories(
                              onTap: (TodoCategory category) {
                                setState(() {
                                  _selectedCategory = category;
                                });
                              },
                            ));
                          });
                    },
                    icon: Icon(
                      Icons.label,
                      color: _selectedCategory == null
                          ? Colors.grey
                          : AppColors.primaryPurple,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TaskPriorityDialog(
                            onTap: (value) {
                              setState(() {
                                _selectedPriority = value;
                              });
                            },
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.flag,
                      color: _selectedPriority == null
                          ? Colors.grey
                          : AppColors.primaryPurple,
                    ),
                  ),
                  const Spacer(),
                  ktodoProvider.isLoading
                      ? const CircularProgressIndicator()
                      : IconButton(
                          onPressed: () async {
                            // Add Task

                            if (_formKey.currentState!.validate()) {
                              if (_selectedPriority == null ||
                                  _selectedCategory == null ||
                                  _selectedDate == null) {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: AppColors.systemRed,
                                    content: Text(
                                      'Please select all fields such as date priority and category',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                                return;
                              }

                              final todoProvider = context.read<TodoProvider>();
                              final todo = Todo(
                                title: titleController.text,
                                description: descriptionController.text,
                                dateTime: _selectedDate!,
                                priority: _selectedPriority!,
                                category: _selectedCategory!,
                              );
                              await todoProvider.addTodo(
                                  todo: todo,
                                  onSuncess: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: AppColors.accentGreen,
                                        content: Text('Task Added'),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  onError: (value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Text(
                                            "Error could not add task: $value"),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  });
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                ],
              ),
              const SizedBox(height: 26.0),
            ],
          ),
        ),
      ),
    );
  }
}
