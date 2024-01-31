import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/globals/providers/validator.dart';
import 'package:uptodo_app/src/globals/utilities/utilities.dart';
import 'package:uptodo_app/src/globals/widgets/custom_button.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo_category.dart';
import 'package:uptodo_app/src/modules/index/index_home/provider/category_provider.dart';

class CreateNewCategory extends StatefulWidget {
  const CreateNewCategory({super.key});

  @override
  State<CreateNewCategory> createState() => _CreateNewCategoryState();
}

class _CreateNewCategoryState extends State<CreateNewCategory> with Validator {
  (String name, Color color) selectedColor = Utils.getAllCategoryColors[0];
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catProvider = context.watch<CategoryProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Create new category",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Category name :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controller,
                validator: nameValidator,
                decoration: const InputDecoration(
                  labelText: 'Category name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Category Icon :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 58, 58),
                    borderRadius: BorderRadius.circular(6.0)),
                child: const Text("Choose Icon from Library"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Category color :",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 30,
                width: 500,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Utils.getAllCategoryColors.length,
                    itemBuilder: (BuildContext context, int idx) {
                      final color = Utils.getAllCategoryColors[idx];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: color.$2,
                            shape: BoxShape.circle,
                            border: selectedColor.$2 == color.$2
                                ? Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  )
                                : null,
                          ),
                        ),
                      );
                    }),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancle"),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 180,
                    child: CustomButton(
                        isLoading: catProvider.isLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //
                            final data = TodoCategory(
                              categoryName: controller.text,
                              iconName: Utils.getAllCategoryIcons.last.$1,
                              color: selectedColor.$1,
                            );

                            await context
                                .read<CategoryProvider>()
                                .addCategory(data);
                            if (mounted) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        title: "Create Category"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
