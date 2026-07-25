import 'package:flutter/material.dart';

class TrainerBottomBar extends StatelessWidget {
  const TrainerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // الأبيض الصافي كخلفية للشريط السفلي
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF838C91).withOpacity(0.15), // ظل خفيف ومعتمد
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: const Color(0xFF838C91).withOpacity(0.2), // حدود رمادية خفيفة وفاصلة
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Color(0xFFFFFFFF), // الأبيض للأيقونة داخل الزر الممتلئ
                ),
                label: const Text(
                  'احجز جلسة الآن',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF), // الأبيض للنص البارز
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E216C), // الكحلي الغامق الأساسي للزر الرئيسي
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF838C91).withOpacity(0.08), // خلفية رمادية خفيفة ومصقولة لزر المحادثة
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF838C91).withOpacity(0.2), // الرمادي المعتمد للإطار
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  color: Color(0xFF0E216C), // الكحلي الغامق للأيقونة لتعزيز الترابط البصري
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}