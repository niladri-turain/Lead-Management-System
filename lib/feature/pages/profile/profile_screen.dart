import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import '../../../core/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
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
            CircleAvatar(
              radius: AppSize.width(0.12),
              backgroundImage: const NetworkImage('https://placeholder.com/150'),
            ),
            SizedBox(height: AppSize.height(0.02)),
            Text(
              "Rahul Sharma",
              style: TextStyle(
                fontSize: AppSize.width(0.05),
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
            ),
            Text(
              "Sales Executive",
              style: TextStyle(
                fontSize: AppSize.width(0.035),
                color: Colors.grey,
              ),
            ),
            SizedBox(height: AppSize.height(0.01)),
            Text(
              "rahul@example.com",
              style: TextStyle(fontSize: AppSize.width(0.035), color: Colors.grey.shade600),
            ),
            Text(
              "+91 98765 43210",
              style: TextStyle(fontSize: AppSize.width(0.035), color: Colors.grey.shade600),
            ),
            SizedBox(height: AppSize.height(0.04)),
            _buildProfileOption(
              icon: Icons.edit_outlined,
              title: "Edit Profile",
              onTap: () => Navigator.pushNamed(context, '/editProfile'),
            ),
            _buildProfileOption(
              icon: Icons.lock_outline,
              title: "Change Password",
              onTap: () => Navigator.pushNamed(context, '/changePassword'),
            ),
            _buildProfileOption(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () => Navigator.pushNamed(context, '/settings'),
            ),
            _buildProfileOption(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () => Navigator.pushNamed(context, '/helpSupport'),
            ),
            _buildProfileOption(
              icon: Icons.logout,
              title: "Logout",
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isLogout ? Colors.red : AppColors.primaryBlue),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : AppColors.black,
          fontSize: AppSize.width(0.04),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: isLogout ? null : const Icon(Icons.chevron_right, color: Colors.grey),
      contentPadding: EdgeInsets.symmetric(horizontal: AppSize.width(0.06), vertical: AppSize.height(0.005)),
    );
  }
}
