import 'package:flutter/material.dart';

// تأكدي من تطابق أسماء الملفات تماماً (حروف كبيرة أو صغيرة كما هي في جهازك)
import 'acceptedscreen.dart';
import 'rejectedscreen.dart';
import 'waitscreen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String status = 'accepted';

    switch (status) {
      case 'accepted':
        return AcceptedScreen();

      case 'waiting':
        return WaitScreen();

      case 'rejected':
        return RejectedScreen();

      default:
        return const Scaffold(body: Center(child: Text('Unknown Status')));
    }
  }
}
