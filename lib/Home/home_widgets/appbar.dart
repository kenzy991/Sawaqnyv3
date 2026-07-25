import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSettingsTap;
  const HomeAppBar({super.key, this.onSettingsTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF), // الأبيض كخلفية
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF838C91).withOpacity(0.3), width: 1.5), 
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF0E216C), // كحلي غامق
              child: Icon(Icons.person, color: Color(0xFFFFFFFF)), 
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Row(
                  children: [
                    Text(
                      'مرحباً، أحمد',
                      style: TextStyle(
                        color: Color(0xFF000000), 
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text('👋', style: TextStyle(fontSize: 13)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 13, color: Color(0xFF0E216C)), 
                    SizedBox(width: 2),
                    Text(
                      'القاهرة، مدينة نصر',
                      style: TextStyle(
                        color: Color(0xFF838C91), 
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // تعديل قسم الـ actions لإضافة أيقونة الترس وتفعيل التربيطة
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF838C91).withOpacity(0.1), // خلفية رمادية خفيفة
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined, // غيرنا الأيقونة لترس الإعدادات بدل الجرس
                color: Color(0xFF0E216C), // الكحلي الغامق
                size: 22,
              ),
              onPressed: onSettingsTap, // تشغيل الانتقال لسكرين 17 بنجاح
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}