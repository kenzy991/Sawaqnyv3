import 'package:flutter/material.dart';
import 'map_details_section.dart';
import 'session_stats_section.dart';
import 'performance_notes_section.dart';
import 'rating_section.dart';

// 1. عملنا import للشاشتين التانيين عشان الأبلكيشن يشوفهم
import '../report_problem/report_problem_screen.dart'; 
import '../change_instructor/change_instructor_screen.dart';

class SessionEvaluationScreen extends StatelessWidget {
  const SessionEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تفاصيل الجلسة',
          style: TextStyle(color: Color(0xFF0047BA), fontWeight: FontWeight.bold),
        ),
        actions: [
          // 2. هنا لما المستخدم يدوس على زرار الثلاث نقاط (⋮) فوق.. هيفتح شاشة الشكاوى
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ReportProblemScreen(), // دي سكرين 13
    ),
  );
},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const MapDetailsSection(),
            const SizedBox(height: 16),
            const SessionStatsSection(),
            const SizedBox(height: 16),
            
            // 3. ضفنا زرار سريع هنا يودي لشاشة "تبديل المدرب" عشان يبقى مكانه منطقي جنب الأداء
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF0047BA),
                side: const BorderSide(color: Color(0xFF0047BA)),
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.swap_horiz, size: 18),
              label: const Text('هل تريد تبديل هذا المدرب؟', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeInstructorScreen(),
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            const PerformanceNotesSection(),
            const SizedBox(height: 16),
            const RatingSection(),
          ],
        ),
      ),
    );
  }
}