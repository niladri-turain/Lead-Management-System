import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_dropdown.dart';

class AddFollowUpScreen extends StatefulWidget {
  const AddFollowUpScreen({super.key});

  @override
  State<AddFollowUpScreen> createState() => _AddFollowUpScreenState();
}

class _AddFollowUpScreenState extends State<AddFollowUpScreen> {
  String selectedType = "Call";
  String selectedPriority = "High";
  String selectedReminder = "30 mins before";

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
          "Add Follow Up",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lead Profile Section
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.width(0.08),
                  backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                  child: Text(
                    "RV",
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: AppSize.width(0.05),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: AppSize.width(0.04)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rahul Verma",
                      style: TextStyle(
                        fontSize: AppSize.width(0.045),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Verma Enterprises",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: AppSize.width(0.035),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSize.height(0.03)),

            // Follow Up Type Dropdown
            CustomDropdown(
              label: "Follow Up Type*",
              value: selectedType,
              items: const ["Call", "Meeting", "Email", "Demo"],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedType = value;
                  });
                }
              },
            ),
            SizedBox(height: AppSize.height(0.02)),

            // Date Selection
            CustomTextField(
              label: "Date*",
              hintText: "15 Jan 2024",
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                size: AppSize.width(0.05),
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(height: AppSize.height(0.02)),

            // Time Selection
            CustomTextField(
              label: "Time*",
              hintText: "10:00 AM",
              suffixIcon: Icon(
                Icons.access_time,
                size: AppSize.width(0.05),
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(height: AppSize.height(0.02)),

            // Priority Dropdown
            CustomDropdown(
              label: "Priority",
              value: selectedPriority,
              items: const ["High", "Medium", "Low"],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedPriority = value;
                  });
                }
              },
            ),
            SizedBox(height: AppSize.height(0.02)),

            // Reminder Dropdown
            CustomDropdown(
              label: "Reminder",
              value: selectedReminder,
              items: const ["30 mins before", "1 hour before", "1 day before"],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedReminder = value;
                  });
                }
              },
            ),
            SizedBox(height: AppSize.height(0.02)),

            // Remarks Field
            const CustomTextField(
              label: "Remarks",
              hintText: "Call to discuss the proposal",
              maxLines: 3,
            ),
            SizedBox(height: AppSize.height(0.05)),

            // Save Action Button
            SizedBox(
              width: double.infinity,
              height: AppSize.height(0.065),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.width(0.02)),
                  ),
                ),
                child: Text(
                  "Save Follow Up",
                  style: TextStyle(
                    fontSize: AppSize.width(0.04),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
