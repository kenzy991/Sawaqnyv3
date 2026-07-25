import 'package:flutter/material.dart';

class SuggestedInstructorsSection extends StatefulWidget {
  const SuggestedInstructorsSection({super.key});

  @override
  State<SuggestedInstructorsSection> createState() => _SuggestedInstructorsSectionState();
}

class _SuggestedInstructorsSectionState extends State<SuggestedInstructorsSection> {
  // متغير عشان نعرف مين المدرب اللي تم اختياره
  int? _selectedInstructor; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'مدربون مقترحون',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 12, color: Color(0xFF0047BA)),
                  SizedBox(width: 4),
                  Text('عرض الكل', style: TextStyle(color: Color(0xFF0047BA), fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // الكابتن سارة كمال
        _buildInstructorCard(
          id: 1,
          name: 'سارة كمال',
          rating: '4.9',
          carType: 'أوتوماتيك',
        ),
        const SizedBox(height: 12),
        
        // الكابتن خالد عمر
        _buildInstructorCard(
          id: 2,
          name: 'خلد عمر',
          rating: '4.7',
          carType: 'عادي',
        ),
      ],
    );
  }

  Widget _buildInstructorCard({required int id, required String name, required String rating, required String carType}) {
    bool isSelected = _selectedInstructor == id;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF8FBFF) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? const Color(0xFF0047BA) : Colors.grey.shade200,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), 
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 14),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 8),
                    const Text('•', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 8),
                    const Icon(Icons.directions_car_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(carType, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedInstructor = id;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? const Color(0xFF0047BA) : Colors.grey.shade300),
                color: isSelected ? const Color(0xFF0047BA) : Colors.white,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.add,
                size: 16,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}