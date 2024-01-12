import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../globals/providers/introduction_provider.dart';

class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<IntroductionProvider>();
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: provider.next2Pressed,
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
