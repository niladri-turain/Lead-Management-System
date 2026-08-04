import 'package:flutter/material.dart';
import '../core/constant/app_color.dart';
import '../core/constant/app_size.dart';

class FollowUpCard extends StatelessWidget {
  final String name;
  final String type;
  final String time;
  final String priority;
  final VoidCallback? onTap;

  const FollowUpCard({
    super.key,
    required this.name,
    required this.type,
    required this.time,
    required this.priority,
    this.onTap,
  });

  Color _getPriorityColor() {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.height(0.015)),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(0.04),
          vertical: AppSize.height(0.015),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.width(0.03)),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: AppSize.width(0.06),
              backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
              child: Text(
                name.isNotEmpty ? name.substring(0, 2).toUpperCase() : "??",
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.width(0.035),
                ),
              ),
            ),
            SizedBox(width: AppSize.width(0.04)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: AppSize.width(0.04),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.height(0.005)),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: AppSize.width(0.032),
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: AppSize.width(0.032),
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppSize.height(0.008)),
                Text(
                  priority,
                  style: TextStyle(
                    fontSize: AppSize.width(0.03),
                    color: _getPriorityColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
