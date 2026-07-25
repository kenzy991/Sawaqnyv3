import 'package:flutter/material.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  // 1: بطاقة، 2: محافظ إلكترونية، 3: إنستاباي، 4: فوري
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'طريقة الدفع',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'اختار طريقة الدفع اللي تريحك.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 16),

          // 1. كارت البنك
          _buildPaymentOption(
            value: 1,
            title: 'بطاقة بنكية (فيزا / ماستركارد / ميزة)',
            icon: Icons.credit_card,
            expandedContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text('رقم الكارت', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                TextField(
                  decoration: InputDecoration(
                    hintText: '0000 0000 0000 0000',
                    prefixIcon: const Icon(Icons.credit_card),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('اسم صاحب الكارت', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'الاسم المكتوب على الكارت',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('تاريخ الانتهاء', style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'شهر/سنة',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('الرقم السري (CVV)', style: TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          TextField(
                            decoration: InputDecoration(
                              hintText: '123',
                              suffixIcon: const Icon(Icons.info_outline, size: 18),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 2. المحافظ الإلكترونية (بديل أبل باي)
          _buildPaymentOption(
            value: 2,
            title: 'المحافظ الإلكترونية (فودافون كاش، إلخ)',
            icon: Icons.phone_android,
            expandedContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text('رقم الموبايل المرتبط بالمحفظة', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '010 / 011 / 012 / 015',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 3. إنستاباي
          _buildPaymentOption(
            value: 3,
            title: 'إنستاباي (InstaPay)',
            icon: Icons.send_to_mobile,
            expandedContent: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Text('عنوان الدفع (InstaPay Address)', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'user@instapay',
                    prefixIcon: const Icon(Icons.alternate_email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 4. فوري
          _buildPaymentOption(
            value: 4,
            title: 'فوري (Fawry)',
            icon: Icons.receipt_long,
            expandedContent: const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'لما تدوسي "تأكيد الدفع"، هيطلعلك كود فوري تروحي تدفعي بيه من أي كشك أو أبلكيشن فوري.',
                style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required int value,
    required String title,
    required IconData icon,
    Widget? expandedContent,
  }) {
    bool isSelected = _selectedValue == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedValue = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF8FBFF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF0047BA) : Colors.grey.shade300,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 24, color: isSelected ? const Color(0xFF0047BA) : Colors.black54),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Radio(
                  value: value,
                  groupValue: _selectedValue,
                  activeColor: const Color(0xFF0047BA),
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val as int;
                    });
                  },
                ),
              ],
            ),
            if (isSelected && expandedContent != null) expandedContent,
          ],
        ),
      ),
    );
  }
}