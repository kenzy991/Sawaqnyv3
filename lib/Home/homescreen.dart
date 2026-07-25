import 'package:flutter/material.dart';

// استيراد الـ Widgets المنفصلة من مجلد home_widgets
import 'home_widgets/appbar.dart';
import 'home_widgets/categoriesgrid.dart';
import 'home_widgets/filterlist.dart';
import 'home_widgets/promobanner.dart';
import 'home_widgets/searchbar.dart';
import 'home_widgets/sectionheader.dart';
import 'home_widgets/trainercard.dart';
import 'home_widgets/schoolslist.dart';

// استيراد الشاشات عشان التربيط
import 'Search/searchscreen.dart'; // سكرين 5
import '../checkout/checkout_screen.dart'; // سكرين 10
import 'package:sawany/profile/settings_screen.dart'; // سكرين 17

// التعديل: استيراد سكرين 15 (مركز المعرفة) - تأكدي من مسار الفايل عندك
import '../more/knowledge_center_screen.dart'; 

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF), // الأبيض كخلفية رئيسية عامة للشاشة
        
        // الأب بار مربوط بـ سكرين 17 (الإعدادات)
        appBar: HomeAppBar(
          onSettingsTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(), // سكرين 17
              ),
            );
          },
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. شريط البحث مربوط بـ سكرين 5 (السيرش)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: HomeSearchBar(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 2. أزرار الفلاتر
                    const FilterChipsList(),
                    const SizedBox(height: 16),

                    // 3. البانر الإعلاني (تم ربطه بـ سكرين 15 مركز المعرفة)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KnowledgeCenterScreen(), // سكرين 15
                            ),
                          );
                        },
                        child: const PromoBanner(), // البانر أصبح قابل للضغط
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 4. الأقسام الرئيسية
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: CategoriesSection(),
                    ),
                    const SizedBox(height: 24),

                    // 5. قسم المدربين (مربوط بـ سكرين 10 الدفع)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SectionHeader(
                        title: 'مدربون بالقرب منك',
                        onSeeAll: () {},
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TrainerCard(
                        onBookTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(), 
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 6. قسم مدارس القيادة
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SectionHeader(
                        title: 'أفضل مدارس القيادة',
                        onSeeAll: () {},
                      ),
                    ),
                    const SizedBox(height: 12),

                    // قائمة مدارس القيادة الأفقية
                    const SchoolsList(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}