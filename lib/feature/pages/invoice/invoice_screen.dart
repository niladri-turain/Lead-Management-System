import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Invoice Screen",
          style: TextStyle(fontSize: 24, color: AppColors.primaryBlue),
        ),
      ),
    );
  }
}
