import 'package:flutter/material.dart';

import '../earnings_wallet/screens/earnings_wallet_screen.dart';
import '../trainer_management/screens/trainer_management_screen.dart';
import '../screens/more_screen.dart';

// استيراد شاشة الجلسة الجديدة
import '../../session_attendance/session_start_screen.dart';

class SchoolNavigation {
  static void navigate(BuildContext context, int index) {
    switch (index) {
      case 0:
        // الجلسة
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const SessionStartScreen(),
          ),
        );
        break;

      case 1:
        // المحفظة
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const EarningsWalletScreen(),
          ),
        );
        break;

      case 2:
        // المدربون
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const TrainerManagementScreen(),
          ),
        );
        break;

      case 3:
        // المزيد
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MoreScreen(),
          ),
        );
        break;
    }
  }
}