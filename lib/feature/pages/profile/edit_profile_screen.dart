import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/custom_dropdown.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
          "Edit Profile",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.width(0.06)),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: AppSize.width(0.12),
                  backgroundImage: const NetworkImage('https://placeholder.com/150'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.height(0.04)),
            const CustomTextField(
              label: "Full Name",
              hintText: "Rahul Sharma",
            ),
            SizedBox(height: AppSize.height(0.02)),
            const CustomTextField(
              label: "Email",
              hintText: "rahul@example.com",
            ),
            SizedBox(height: AppSize.height(0.02)),
            const CustomTextField(
              label: "Mobile Number",
              hintText: "+91 98765 43210",
            ),
            SizedBox(height: AppSize.height(0.02)),
            CustomDropdown(
              label: "Designation",
              value: "Sales Executive",
              items: const ["Sales Executive", "Manager", "Admin"],
              onChanged: (v) {},
            ),
            SizedBox(height: AppSize.height(0.06)),
            SizedBox(
              width: double.infinity,
              height: AppSize.height(0.06),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Update Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
