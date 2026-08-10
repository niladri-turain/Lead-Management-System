import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "About Us",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSize.width(0.1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.trending_up, color: Colors.white, size: 50),
              ),
              SizedBox(height: AppSize.height(0.02)),
              Text(
                "LeadPro",
                style: TextStyle(fontSize: AppSize.width(0.07), fontWeight: FontWeight.bold, color: AppColors.primaryBlue),
              ),
              const Text("Lead Management System", style: TextStyle(color: Colors.grey)),
              SizedBox(height: AppSize.height(0.04)),
              const Text(
                "LeadPro is a simple and powerful lead management system to help you manage leads, follow-ups, invoices and grow your business.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              SizedBox(height: AppSize.height(0.06)),
              const Text("Version 1.0.0", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const Spacer(),
              const Text("© 2024 LeadPro. All rights reserved.", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
