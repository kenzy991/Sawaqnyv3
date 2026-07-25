import 'package:flutter/material.dart';

// استيراد الملفات المطلوبة
import 'student_signup_screens.dart';
import 'school_signup_screen.dart';
import 'coach_registration_screen.dart';
import 'review_status_screen.dart'; 

class IdentitySelectionScreen extends StatelessWidget {
  const IdentitySelectionScreen({Key? key}) : super(key: key);

  // Brand Palette Constants (دليل ألوان منصة "سوقني")
  static const Color primaryNavy = Color(0xFF0E216C);      // 60%: الكحلي الغامق للعناوين والخلفيات الرئيسية والحدود
  static const Color accentOrange = Color(0xFFFE8511);     // 10%: البرتقالي المميز لأزرار الإجراءات (CTA)
  static const Color neutralWhite = Color(0xFFFFFFFF);     // 30%: الأبيض لخلفية الواجهة والكروت
  static const Color neutralGray = Color(0xFF838C91);      // 30%: الرمادي للنصوص الثانوية والحدود
  static const Color neutralBlack = Color(0xFF000000);     // 30%: الأسود للعناوين الكبيرة والنصوص الرئيسية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite, // 30% الأبيض للخلفية الرئيسية
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Screen Title
              const Text(
                'كيف تحب أن تبدأ رحلتك؟',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: neutralBlack, // 30% الأسود للنصوص الرئيسية
                ),
              ),

              const SizedBox(height: 32),

              // Both Options Side by Side
              Expanded(
                child: Row(
                  children: [
                    // --- 1. Driving School Option ---
                    Expanded(
                      child: Column(
                        children: [
                          // Main Card
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: neutralWhite, // 30% الأبيض لخلفية الكروت
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: neutralGray.withOpacity(0.3), // 30% الرمادي للحدود
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryNavy.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Title
                                  const Text(
                                    'أنا مدرسة تدريب',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: primaryNavy, // 60% الكحلي لعنوان الكارت الرئيسي
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Icon Container
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: primaryNavy.withOpacity(0.08), // تدرج خفيف من الكحلي الأساسي
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      Icons.apartment_rounded,
                                      size: 48,
                                      color: primaryNavy, // 60% الكحلي الأساسي للأيقونة
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Description Text
                                  const Text(
                                    'إدارة المتدربين والمدربين، وتوسيع نطاق مدرستك.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.4,
                                      color: neutralGray, // 30% الرمادي للنصوص الثانوية
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // School Action Button (Outline Navy) - تم ربطه بـ SchoolSignupScreen بناءً على طلبك
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SchoolAuthScreen(),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: primaryNavy, width: 2), // 60% الكحلي للحدود
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'إرسال طلب انضمام',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: primaryNavy, // 60% الكحلي للنص
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    // --- 2. Student Option ---
                    Expanded(
                      child: Column(
                        children: [
                          // Main Card
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: neutralWhite, // 30% الأبيض لخلفية الكروت
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: neutralGray.withOpacity(0.3), // 30% الرمادي للحدود
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryNavy.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Title
                                  const Text(
                                    'أنا متدرب',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: accentOrange, // 10% البرتقالي المميز لعنوان الكارت
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Icon Container
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: accentOrange.withOpacity(0.1), // تدرج خفيف من البرتقالي الأساسي
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      Icons.school_rounded,
                                      size: 48,
                                      color: accentOrange, // 10% البرتقالي الأساسي للأيقونة
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Description Text
                                  const Text(
                                    'ابحث عن أفضل الدورات والمدارس، وابدأ التعلم الآن.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.4,
                                      color: neutralGray, // 30% الرمادي للنصوص الثانوية
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Student Action Button (Solid CTA Orange)
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AuthScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accentOrange, // 10% البرتقالي المميز لزر الإجراءات الرئيسي (CTA)
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'استمرار متدرب',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: neutralWhite, // 30% الأبيض لنص الزر
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}