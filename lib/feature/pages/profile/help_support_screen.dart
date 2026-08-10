import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
          "Help & Support",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppSize.height(0.02)),
            Center(
              child: Container(
                height: AppSize.height(0.2),
                width: AppSize.width(0.4),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.support_agent,
                  size: AppSize.height(0.12),
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
            SizedBox(height: AppSize.height(0.02)),
            const Text(
              "We are here to help you!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: AppSize.height(0.04)),
            _buildSupportItem(Icons.help_outline, "FAQs"),
            _buildSupportItem(Icons.menu_book_outlined, "User Guide"),
            _buildSupportItem(Icons.play_circle_outline, "Video Tutorials"),
            _buildSupportItem(Icons.headset_mic_outlined, "Contact Support", onTap: () => Navigator.pushNamed(context, '/contactSupport')),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.primaryBlue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(horizontal: AppSize.width(0.08)),
    );
  }
}
