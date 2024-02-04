import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/globals/providers/validator.dart';
import 'package:uptodo_app/src/globals/utilities/utilities.dart';
import 'package:uptodo_app/src/globals/widgets/custom_button.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo_category.dart';
import 'package:uptodo_app/src/modules/index/index_home/provider/todo_provider.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/choose_categories.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/show_calendar.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/task_priority.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({
    super.key,
  });

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> with Validator {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TodoCategory? _selectedCategory;
  int? _selectedPriority;
  bool? _isDone;
  DateTime? _selectedDate;
  String formattedDate = '';
  Todo? todo;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      prefileData();
    });
  }

  prefileData() {
    todo = ModalRoute.of(context)!.settings.arguments as Todo;
    titleController.text = todo!.title;
    _selectedCategory = todo!.category;
    descriptionController.text = todo!.description;
    _selectedPriority = todo!.priority;
    _selectedDate = todo!.dateTime;
    _isDone = todo!.isDone;

    setState(() {});
  }

  final decoration = BoxDecoration(
    color: const Color.fromARGB(255, 61, 58, 58),
    borderRadius: BorderRadius.circular(6.0),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    formattedDate = _selectedDate != null
        ? _selectedDate!.day == DateTime.now().day
            ? 'Today at ${DateFormat.Hm().format(_selectedDate!)}'
            : DateFormat('MMM d, y').add_jm().format(_selectedDate!)
        : '';

    final todoProvider = context.watch<TodoProvider>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.cancel_outlined)),
                      const Spacer(),
                      const Icon(Icons.swap_calls_outlined),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isDone = !_isDone!;
                          });
                        },
                        child: _isDone == true
                            ? const Icon(Icons.circle)
                            : const Icon(Icons.circle_outlined),
                      ),
                      const SizedBox(
                        width: 21,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: titleController,
                          validator: nameValidator,
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.draw_outlined),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, right: 30),
                    child: TextFormField(
                      controller: descriptionController,
                      validator: nameValidator,
                      style: const TextStyle(
                        fontSize: 17.2,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _subTitles("Task Time:", Icons.timer_outlined),
                      const Spacer(),
                      InkWell(
                        onTap: () {
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
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: decoration,
                          height: 37,
                          child: Center(
                            child: Text(
                              formattedDate,
                            ),
                          ),
                          // e.g Todoay at 16:21
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _subTitles("Task Category:", Icons.label_outline),
                      const Spacer(),
                      _selectedCategory != null
                          ? InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: ChooseCategories(
                                          onTap: (TodoCategory category) {
                                            setState(() {
                                              _selectedCategory = category;
                                            });
                                          },
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: decoration,
                                height: 40,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 6.0,
                                    ),
                                    Icon(
                                      Utils.getIconFromString(
                                          _selectedCategory!.iconName),
                                      color: Utils.getColorFromString(
                                          _selectedCategory!.color),
                                    ),
                                    const SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(_selectedCategory!.categoryName),
                                    const SizedBox(
                                      width: 6.0,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _subTitles("Task Priority:", Icons.flag_outlined),
                      const Spacer(),
                      InkWell(
                        onTap: () {
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
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: decoration,
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              _selectedPriority.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  todoProvider.isLoading
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () async {
                            final provider = context.read<TodoProvider>();
                            provider.deleteTodo(
                              id: todo!.id!,
                              onError: (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Error deleting $error"),
                                  ),
                                );
                              },
                              onSucess: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Sucessfully deleted"),
                                  ),
                                );
                                Navigator.of(context).pop();
                              },
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Delete Task',
                                style: TextStyle(
                                  fontSize: 17.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                  // const Spacer(),
                  const SizedBox(
                    height: 100,
                  ),
                  todoProvider.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            isLoading: false,
                            onPressed: () {
                              final provider = context.read<TodoProvider>();

                              if (_formKey.currentState!.validate() &&
                                  _selectedDate != null &&
                                  _selectedCategory != null &&
                                  _selectedPriority != null) {
                                var newTodo = Todo(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  dateTime: _selectedDate!,
                                  category: _selectedCategory!,
                                  priority: _selectedPriority!,
                                  isDone: _isDone ?? false,
                                  id: todo!.id,
                                );

                                provider.updateTodo(
                                  todo: newTodo,
                                  onError: (err) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Error updating $err"),
                                      ),
                                    );
                                  },
                                  onSucess: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Sucessfully updated"),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                            title: "Save edit",
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _subTitles(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 18,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17.2,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
