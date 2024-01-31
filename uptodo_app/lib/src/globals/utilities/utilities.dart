import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/themes/app_colors.dart';

class Utils {
  /// All available colors for categories
 static const List<(String colorName, Color color)> getAllCategoryColors = [
    ("red", AppColors.systemRed),
    ("orange", AppColors.systemOrange),
    ("green", AppColors.systemGreen),
    ("teal", AppColors.systemTeal),
    ("blue", AppColors.systemBlue),
    ("indigo", AppColors.systemIndigo),
    ("purple", AppColors.systemPurple),
    ("pink", AppColors.systemPink),
  ];

  /// All available Icons for categories
 static const List<(String iconName, IconData icon)> getAllCategoryIcons = [
    ("groceryIcon", Icons.fastfood_outlined),
    ("workIcon", Icons.work_outline_rounded),
    ("sportIcon", Icons.sports),
    ("designIcon", Icons.brush_outlined),
    ("uniIcon", Icons.location_city),
    ("socialIcon", Icons.public),
    ("musicIcon", Icons.music_note),
    ("healthIcon", Icons.health_and_safety_outlined),
    ("movieIcon", Icons.movie),
    ("homeIcon", Icons.home_outlined),
    ("addIcon", Icons.add),
    ("noteIcon", Icons.note_add),
  ];

  static Color getColorFromString(String name) {
    return getAllCategoryColors
        .firstWhere((element) => element.$1 == name)
        .$2;
  }

  static IconData getIconFromString(String name) {
    return getAllCategoryIcons
        .firstWhere((element) => element.$1 == name)
        .$2;
  }
}
