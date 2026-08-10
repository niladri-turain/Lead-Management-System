import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          "Settings",
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(0.05),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSize.width(0.04)),
        children: [
          _buildSectionHeader("General"),
          _buildSettingItem(Icons.person_outline, "Profile Settings"),
          _buildSettingItem(Icons.notifications_none, "Notification Settings"),
          _buildSettingItem(Icons.lock_outline, "Change Password"),
          SizedBox(height: AppSize.height(0.02)),
          _buildSectionHeader("App"),
          _buildSettingItem(Icons.language, "Language", trailing: "English"),
          _buildSettingItem(Icons.dark_mode_outlined, "Theme", trailing: "Light"),
          _buildSettingItem(Icons.info_outline, "About App", onTap: () => Navigator.pushNamed(context, '/aboutUs')),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.height(0.01), horizontal: AppSize.width(0.02)),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: AppSize.width(0.035)),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, {String? trailing, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.primaryBlue, size: 22),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) Text(trailing, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}
