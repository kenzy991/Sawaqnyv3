import 'package:flutter/material.dart';
import 'current_instructor_section.dart';
import 'change_reason_section.dart';
import 'suggested_instructors_section.dart';

class ChangeInstructorScreen extends StatelessWidget {
  const ChangeInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تبديل المدرب',
          style: TextStyle(color: Color(0xFF0047BA), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentInstructorSection(),
            SizedBox(height: 24),
            ChangeReasonSection(),
            SizedBox(height: 24),
            SuggestedInstructorsSection(),
            SizedBox(height: 20), // مسافة عشان الزرار اللي تحت مفيش حاجة تتدارى وراه
          ],
        ),
      ),
      // زرار طلب التبديل الثابت تحت
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0047BA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم إرسال طلب التبديل بنجاح!', textAlign: TextAlign.center),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('طلب تبديل', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.swap_horiz, size: 20, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}