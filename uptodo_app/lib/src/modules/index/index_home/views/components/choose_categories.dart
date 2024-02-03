import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/globals/utilities/utilities.dart';
import 'package:uptodo_app/src/globals/widgets/custom_button.dart';
import 'package:uptodo_app/src/modules/index/index_home/model/todo_category.dart';
import 'package:uptodo_app/src/modules/index/index_home/provider/category_provider.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/components/create_category.dart';

class ChooseCategories extends StatefulWidget {
  const ChooseCategories({super.key, required this.onTap});

  final Function(TodoCategory category) onTap;

  @override
  State<ChooseCategories> createState() => _ChooseCategoriesState();
}

class _ChooseCategoriesState extends State<ChooseCategories> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CategoryProvider>().getAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final catData = context.watch<CategoryProvider>();
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF363636),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 500,
      width: size.width * 0.95,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Choose Category",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Color(0xFF979797),
          ),
          const SizedBox(
            height: 5,
          ),
          catData.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      shrinkWrap: true,
                      itemCount: catData.categories.length,
                      itemBuilder: (BuildContext context, int idx) {
                        final category = catData.categories[idx];
                        final color = Utils.getColorFromString(category.color);
                        final icon = Utils.getIconFromString(category.iconName);
                        return InkWell(
                          onTap: () {
                            if (category.categoryName == "Create New") {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const CreateNewCategory();
                                  });
                            } else {
                              widget.onTap(category);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Icon(icon),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(category.categoryName)
                            ],
                          ),
                        );
                      }),
                ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            isLoading: false,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const CreateNewCategory();
                  });
            },
            title: "Add Category",
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

// FilledButton(
//               style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//               )),
//               onPressed: () {},
//               child: const Text("Add Category"),
//             ),
// ** 
