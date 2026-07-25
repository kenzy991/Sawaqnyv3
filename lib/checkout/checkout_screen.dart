import 'package:flutter/material.dart';
import 'package:sawany/checkout/Booking/bookingsscreen.dart';
// اتأكدي إنك عاملة الفايلات دي وحاطة فيها الكود اللي بعتهولك قبل كده
import 'payment_method_section.dart';
import 'session_details_section.dart';
import 'summary_and_pay_section.dart';
import 'Booking/bookingsscreen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // السعر هنا متغير عشان لو حبيتي تربطيه بعدين باللي اليوزر بيختاره
    String dynamicPrice = "184.00 ج.م"; 

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB), 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'إتمام الحجز',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. قسم طرق الدفع
            const PaymentMethodSection(),
            const SizedBox(height: 16),
            
            // 2. زرار تأكيد الدفع 
            SizedBox(
              width: double.infinity,
              height: 55, // كبرنا الزرار شوية عشان يبقى مريح
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0047BA), // لون الزرار
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
  // الرسالة الخضراء
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('تم تأكيد الدفع بنجاح!', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    ),
  );

  // التربيطة لشاشة 11 (الحجوزات) بعد ثانيتين
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BookingsScreen()),
    );
  });
},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('تأكيد الدفع', style: TextStyle(fontSize: 16, color: Colors.white)), // خلينا اللون أبيض
                    const SizedBox(width: 10),
                    Text(dynamicPrice, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_back, size: 20, color: Colors.white),
                    
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 3. قسم تفاصيل الجلسة (شلنا الكومنت عشان تظهر)
            SessionDetailsSection(), 
            const SizedBox(height: 16),

            // 4. قسم ملخص الدفع (شلنا الكومنت عشان تظهر)
            SummaryAndPaySection(),
          ],
        ),
      ),
    );
  }
}