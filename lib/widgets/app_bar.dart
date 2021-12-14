import 'package:flutter/material.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const TopBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      foregroundColor: const Color.fromARGB(255, 20, 33, 61),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
