import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SchoolAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final VoidCallback? onNotificationPressed;

  const SchoolAppBar({
    super.key,

    required this.title,

    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.primary,

      foregroundColor: AppColors.white,

      elevation: 0,

      title: Text(
        title,

        style: const TextStyle(
          fontSize: 16,

          fontWeight: FontWeight.bold,

          color: AppColors.white,
        ),
      ),

      actions: [
        IconButton(
          onPressed: onNotificationPressed,

          icon: const Icon(Icons.notifications_none),
        ),
      ],

      leading: const Padding(
        padding: EdgeInsets.all(8),

        child: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=32'),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
